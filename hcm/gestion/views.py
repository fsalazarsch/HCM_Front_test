from django.shortcuts import render
from django.template import loader, Context
from django.http import HttpResponse
from gestion.forms import Formreserva
from gestion.models import sala, horario, estado, solicitud
from django.db.models import Max
from datetime import datetime
# Create your views here.

#formulario de peticion de reserva
def index(request):
    template = loader.get_template("index.html")
    context = {"form": Formreserva}
    return HttpResponse(template.render(context, request))	

#ejecuta la funcion de reserva, si hay un horario confirmado, se puede ejecutar la peticion de pedir la sala
def reservar(request):
    if request.method == "POST":
        form = Formreserva(request.POST)
        if form.is_valid():
            fecha = request.POST.get('fecha')
            inicio = datetime.strptime(request.POST.get('hora_inicio'), '%H:%M' ).time()
            termino = datetime.strptime(request.POST.get('hora_termino'), '%H:%M' ).time()
            personas = request.POST.get('personas')
            insumos = request.POST.get('insumos')
            #auxiliares y formateos de fecha
            mensaje = ''
            res = []
            f = "%Y-%m-%d"
            fecha_comp = datetime.strptime(fecha, f)

            salas_disp = sala.objects.filter(insumos__gte = insumos, capacidad__gte= personas )
            disponibles = sala.objects.values_list('sala_id', flat=True).filter(insumos__gte = insumos, capacidad__gte= personas )
            for disp in disponibles:
                disponibilidad_horaria = horario.objects.filter(sala_id= disp)
                disponibilidad_horaria = disponibilidad_horaria.filter(fecha = fecha_comp)
                disponibilidad_horaria = disponibilidad_horaria.filter(inicio__range = (inicio, termino) ) | disponibilidad_horaria.filter(termino__range =(inicio, termino))
                res.append(disponibilidad_horaria)
                if len(disponibilidad_horaria) == 0:
                #graba horario 
                    maximo = int(horario.objects.latest('horario_id').horario_id)

                    h = horario(horario_id = maximo+1, fecha = fecha, inicio=inicio, termino=termino, sala_id=sala.objects.get(pk=disp), estado_id=estado.objects.get(pk=4))
                    h.save()
                    mensaje= "Se ha reservado la sala "+sala.objects.get(pk=disp).nombre
                    break
                else:
                    mensaje= "Error, No hay salas para poder reservar"
                    #revisamos si hay salas reservadas para poder hacer una solicitud
                    for dh in res:
                        if dh[0].estado_id.detalle == "Reservada":
                            mensaje= "La sala "+dh[0].sala_id.nombre+" esta reservada, pero puede solicitarla <a href='/solicitar?id="+str(dh[0].horario_id)+"'>aqui</a>"
                            break

            template = loader.get_template("reservar.html")    
            context = {"disp": salas_disp, "mensaje": mensaje}
            return HttpResponse(template.render(context, request))		

#realiza la solicitud
def solicitar(request):
    hor_id = request.GET.get('id')
    s = solicitud(horario_id = horario.objects.get(pk=hor_id))
    s.save()
    template = loader.get_template("solicitar.html")
    mensaje="Horario solicitado correctamente"   
    context = {"mensaje": mensaje}
    return HttpResponse(template.render(context, request))	    

#despliega horarios en calendario
def horarios(request):
    hors = horario.objects.order_by('inicio')
    template = loader.get_template("horario.html")
    context = {"horarios":hors}
    return HttpResponse(template.render(context, request))

#elimina un horario 
def eliminar_horario(request):
    if request.user.is_superuser:
        hor_id = request.GET.get('id')
        h = horario.objects.get(pk=hor_id)
        h.delete()
        return HttpResponse("Correcto")
    else:
        return HttpResponse("Error")

