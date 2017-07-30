from django import forms

class Formreserva(forms.Form):
	fecha =  forms.DateField(required=True, widget=forms.DateInput(format=('%d-%m-%Y'), attrs={'placeholder':'Selecciona una fecha', 'type' : 'date'}))
	hora_inicio =  forms.TimeField(required=True, widget=forms.TimeInput(format=('%H:%m'), attrs={'placeholder':'Selecciona una hora ', 'type' : 'time'}))
	hora_termino =  forms.TimeField(required=True, widget=forms.TimeInput(format=('%H:%m'), attrs={'placeholder':'Selecciona una hora ', 'type' : 'time'}))
	personas =  forms.IntegerField(widget=forms.TextInput(attrs={'placeholder': 'N Personas', 'type' : 'number'}))
	insumos =  forms.IntegerField(widget=forms.TextInput(attrs={'placeholder': 'Insumos', 'type' : 'number'}))
