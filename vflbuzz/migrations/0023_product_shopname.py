# Generated by Django 3.0.8 on 2021-03-20 09:19

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('vflbuzz', '0022_product_vendorname'),
    ]

    operations = [
        migrations.AddField(
            model_name='product',
            name='ShopName',
            field=models.CharField(default=0, max_length=100),
            preserve_default=False,
        ),
    ]
