from __future__ import unicode_literals

from django.db import models

from django.contrib.auth.models import User
from django.contrib import admin

# Create your models here.
class sala(models.Model):
    sala_id = models.IntegerField(primary_key=True)
    nombre = models.CharField(max_length=250) 
    ubicacion = models.CharField(max_length=250)
    capacidad = models.IntegerField()
    pizarron = models.BooleanField(default=True)
    proyector = models.BooleanField(default=True)
    insumos = models.IntegerField()
    def __str__(self):
        return "%s" % ( self.nombre)
    def __unicode__(self):
        return u'%s' % (self.nombre)

class salaAdmin(admin.ModelAdmin):
    list_display = ['nombre', 'ubicacion', 'capacidad', 'insumos', 'pizarron', 'proyector']
admin.site.register(sala, salaAdmin)

class estado(models.Model):
    estado_id = models.IntegerField(primary_key=True)
    detalle = models.CharField(max_length=50)
    #color = models.CharField(max_length=50)
    def __str__(self):
        return "%s" % ( self.detalle)
    def __unicode__(self):
        return u'%s' % (self.detalle)

class estadoAdmin(admin.ModelAdmin):
    list_display = ['estado_id', 'detalle']
admin.site.register(estado, estadoAdmin)

class horario(models.Model):
    horario_id = models.IntegerField(primary_key=True)
    fecha = models.DateField(auto_now_add=False)
    inicio = models.TimeField();
    termino = models.TimeField();
    sala_id = models.ForeignKey(sala, related_name="sala", db_column="sala_id")
    estado_id = models.ForeignKey(estado, related_name="estado", db_column="estado_id")
    def __str__(self):
        return "%s (%s - %s) Sala %s" % ( self.fecha, self.inicio, self.termino, self.sala_id)
    def __unicode__(self):
        return u'%s (%s - %s) Sala %s' % ( self.fecha, self.inicio, self.termino, self.sala_id)
class horarioAdmin(admin.ModelAdmin):
    list_display = ['horario_id', 'fecha', 'inicio', 'termino', 'sala_id', 'estado_id']


admin.site.register(horario, horarioAdmin)

class solicitud(models.Model):
    tstamp = models.DateTimeField(auto_now=True)
    horario_id = models.ForeignKey(horario, related_name="horario", db_column="horario_id")
class solicitudAdmin(admin.ModelAdmin):
    list_display = ['tstamp', 'horario_id']
admin.site.register(solicitud, solicitudAdmin)
