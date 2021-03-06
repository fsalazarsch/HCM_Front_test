# -*- coding: utf-8 -*-
# Generated by Django 1.10.7 on 2017-07-30 03:34
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='estado',
            fields=[
                ('estado_id', models.IntegerField(primary_key=True, serialize=False)),
                ('detalle', models.CharField(max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='horario',
            fields=[
                ('horario_id', models.IntegerField(primary_key=True, serialize=False)),
                ('fecha', models.DateField(auto_now=True)),
                ('inicio', models.TimeField()),
                ('termino', models.TimeField()),
                ('estado_id', models.ForeignKey(db_column='estado_id', on_delete=django.db.models.deletion.CASCADE, related_name='estado', to='gestion.estado')),
            ],
        ),
        migrations.CreateModel(
            name='sala',
            fields=[
                ('sala_id', models.IntegerField(primary_key=True, serialize=False)),
                ('nombre', models.CharField(max_length=250)),
                ('ubicacion', models.CharField(max_length=250)),
                ('capacidad', models.IntegerField()),
                ('pizarron', models.BooleanField(default=True)),
                ('proyector', models.BooleanField(default=True)),
                ('insumos', models.IntegerField()),
            ],
        ),
        migrations.AddField(
            model_name='horario',
            name='sala_id',
            field=models.ForeignKey(db_column='sala_id', on_delete=django.db.models.deletion.CASCADE, related_name='sala', to='gestion.sala'),
        ),
    ]
