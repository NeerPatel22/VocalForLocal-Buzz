# Generated by Django 3.0.8 on 2021-03-08 08:18

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('vflbuzz', '0009_auto_20210308_1232'),
    ]

    operations = [
        migrations.AddField(
            model_name='vendordetails',
            name='Pincode',
            field=models.CharField(default=0, max_length=10),
            preserve_default=False,
        ),
    ]
