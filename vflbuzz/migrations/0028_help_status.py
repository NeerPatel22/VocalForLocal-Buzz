# Generated by Django 3.0.8 on 2021-05-08 11:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('vflbuzz', '0027_help'),
    ]

    operations = [
        migrations.AddField(
            model_name='help',
            name='status',
            field=models.CharField(default=0, max_length=20),
            preserve_default=False,
        ),
    ]
