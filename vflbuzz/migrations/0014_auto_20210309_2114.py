# Generated by Django 3.0.8 on 2021-03-09 15:44

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('vflbuzz', '0013_auto_20210309_1535'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='product',
            name='ProductEXPDate',
        ),
        migrations.RemoveField(
            model_name='product',
            name='ProductMFGDate',
        ),
    ]