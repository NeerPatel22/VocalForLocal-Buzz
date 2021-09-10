from django.db import models
import datetime

# Create your models here.


class Login(models.Model):
    # ID = models.AutoField(primary_key=True)
    USERNAME = models.CharField(max_length=20, unique=True)
    PASSWORD = models.CharField(max_length=50)
    EMAILID = models.EmailField(max_length=64)
    ROLE = models.CharField(max_length=10)
    PINCODE = models.CharField(max_length=10)


class Category(models.Model):
    CATEGORY = models.CharField(max_length=100)
    Status = models.CharField(max_length=15, default='approve')
    categoryby = models.CharField(max_length=20, default='admin')


class Product(models.Model):
    VendorUsername = models.CharField(max_length=20)
    VendorName = models.CharField(max_length=50)
    CATEGORY = models.CharField(max_length=50)
    ProductName = models.CharField(max_length=100)
    ProductPrice = models.BigIntegerField()
    ProductQuantity = models.CharField(max_length=15)
    ProductBrand = models.CharField(max_length=30)
    ProductDeliveryCharge = models.CharField(max_length=5)
    ProductDescription = models.CharField(max_length=500)
    ProductImage1 = models.ImageField(upload_to='product_images/', null=True)
    Status = models.CharField(max_length=15)
    ShopName = models.CharField(max_length=100)
    Notification = models.CharField(max_length=4)


class VendorDetails(models.Model):
    USERNAME = models.CharField(max_length=20)
    ShopName = models.CharField(max_length=100)
    VendorName = models.CharField(max_length=50)
    ContactNo = models.CharField(max_length=12)
    Email = models.CharField(max_length=64)
    ShopAddress = models.CharField(max_length=500)
    Pincode = models.CharField(max_length=6)
    AboutShop = models.CharField(max_length=500)
    GSTNo = models.CharField(max_length=15)
    LicenseNo = models.CharField(max_length=30)
    Status = models.CharField(max_length=15)


class Orders(models.Model):
    CustomerUserName = models.CharField(max_length=20)
    CustomerName = models.CharField(max_length=50)
    CustomerAddress = models.CharField(max_length=500)
    CustomerPhone = models.CharField(max_length=15)
    CustomerEmail = models.EmailField(max_length=64)
    VendorUsername = models.CharField(max_length=20)
    VendorEmail = models.EmailField(max_length=64)
    ShopName = models.CharField(max_length=100)
    ProductId = models.IntegerField()
    ProductName = models.CharField(max_length=100)
    ProductQuantity = models.CharField(max_length=15)
    ProductPrice = models.CharField(max_length=10)
    PlaceDate = models.DateField(default=datetime.datetime.today)
    Status = models.CharField(max_length=20)
    ProductImage = models.ImageField(upload_to='order_products_images/', null=True)


class Help(models.Model):
    name = models.CharField(max_length=20)
    subject = models.CharField(max_length=50)
    description = models.CharField(max_length=500)
    status = models.CharField(max_length=20)
