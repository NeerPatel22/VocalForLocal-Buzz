# Generated by Django 3.0.8 on 2021-03-12 17:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('vflbuzz', '0017_product_status'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='ProductPrice',
            field=models.FloatField(max_length=10),
        ),
    ]
