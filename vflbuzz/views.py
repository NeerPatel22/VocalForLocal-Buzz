import requests
from django.shortcuts import render, redirect
import hashlib
from .models import Login, Category, Product, VendorDetails, Orders, Help
from django.contrib import messages
from django.conf import settings
from django.core.mail import send_mail
import math
import random

# Create your views here.


def index(request):
    status = 'approve'
    cat = Category.objects.all().filter(Status=status)
    if request.session.has_key('username'):
        user = request.session['username']
        role = request.session['role']
        if request.session.has_key('pincode'):
            pv = request.session['pincode']
        else:
            pv = request.session['pincode'] = 'no'
        pincode = Login.objects.get(USERNAME=user)
        return render(request, 'index.html',
                      {'category': cat, 'user': user, 'role': role, 'pin': pincode, 'pv': pv})
    return render(request, 'index.html', {'category': cat})


def pincode(request):
    pincode = request.POST['pin']
    user = request.session['username']
    pin = Login.objects.get(USERNAME=user)
    pin.PINCODE = pincode
    request.session['pincode'] = 'yes'
    pin.save()
    return redirect('index')


def login(request):
    """ Method for Login """
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['psw']
        password = hashlib.md5(str.encode(password)).hexdigest()

        if Login.objects.filter(USERNAME=username, PASSWORD=password).exists():
            log = Login.objects.get(USERNAME=username)
            role = log.ROLE
            request.session['username'] = username
            request.session['role'] = role
            # messages.success(request, 'Login successful')
            if role == 'user':
                return redirect('index')
            elif role == 'vendor':
                return redirect('vendordashbord')
            elif role == 'admin':
                return redirect('admindashbord')
        else:
            messages.error(request, 'invalid credentials')
            return redirect('login')
    else:
        return render(request, 'login.html')


def register(request):
    """ Method for register """
    if request.method == 'POST':
        role = 'user'
        username = request.POST['username']
        password = request.POST['psw']
        cpassword = request.POST['cpsw']
        email = request.POST['email']

        if password == cpassword:
            uv = Login.objects.filter(USERNAME=username)
            if uv.count() > 0:
                messages.error(request, 'Username is Taken')
                return redirect('Register')
            else:
                password1 = hashlib.md5(str.encode(password)).hexdigest()
                user = Login(USERNAME=username, PASSWORD=password1, EMAILID=email, ROLE=role)
                user.save()
                messages.success(request, 'Register successful')
                return redirect('login')
        else:
            messages.error(request, 'Password and Confirm password Not Match')
            return redirect('Register')
    else:
        return render(request, 'login.html')


def admindesh(request):
    if request.session.has_key('username'):
        user = request.session['username']
        role = request.session['role']
        status = 'pending'
        cat = Category.objects.all()
        pro = Product.objects.all().filter(Status=status)
        vend = VendorDetails.objects.all().filter(Status=status)
        return render(request, 'admin.html', {'user': user, 'role': role, 'vendordetails': vend, 'product': pro})
    else:
        return render(request, 'login.html')


def admin_category(request):
    if request.session.has_key('username'):
        user = request.session['username']
        role = request.session['role']
        status = 'requested'
        status2 = 'approve'
        cat = Category.objects.all().filter(Status=status)
        order = Category.objects.all().filter(Status=status2)
        return render(request, 'admin_category.html', {'user': user, 'role': role, 'category': order, 'request': cat})
    else:
        return render(request, 'login.html')


def admin_order(request):
    if request.session.has_key('username'):
        id = request.POST['id']
        user = request.session['username']
        role = request.session['role']
        vn = VendorDetails.objects.get(id=id)
        vendor = vn.USERNAME
        order = Orders.objects.all().filter(VendorUsername=vendor)
        return render(request, 'admin_orders.html', {'user': user, 'role': role, 'order': order})
    else:
        return render(request, 'login.html')


def vendor_product_display(request):
    if request.session.has_key('username'):
        user = request.session['username']
        role = request.session['role']
        ven = VendorDetails.objects.all()
        pro = Product.objects.all()
        return render(request, 'admin_vendor_product.html', {'user': user, 'role': role, 'vendor': ven, 'product': pro})
    else:
        return render(request, 'login.html')


def addcategory(request):
    cat = request.POST['category']
    category = Category(CATEGORY=cat)
    category.save()
    return redirect('admindashbord')


def vendordesh(request):
    if request.session.has_key('username'):
        user = request.session['username']
        role = request.session['role']
        cat = Category.objects.all().filter(Status='approve')
        pro = Product.objects.all().filter(VendorUsername=user)
        Notify = Product.objects.all().filter(Notification='0', VendorUsername=user)
        return render(request, 'vendor.html', {'user': user, 'role': role, 'category': cat, 'product': pro,
                                               'notification': Notify})
    else:
        return redirect('login')


def editproduct(request):
    if request.method == 'POST':
        user = request.session['username']
        price = request.POST['price']
        quantity = request.POST['quantity']
        delivery = request.POST['delivery']
        cid = request.POST['cid']
        uc = Product.objects.get(id=cid)
        uc.ProductPrice = price
        uc.ProductQuantity = quantity
        uc.ProductDeliveryCharge = delivery
        uc.save()
        messages.success(request, 'Update successful')
        return redirect('vendordashbord')


def delete_product(request):
    id = request.GET.get('id')
    pro = Product.objects.get(id=id)
    pro.delete()
    return redirect('vendordashbord')


def logout(request):
    del request.session['username']
    del request.session['role']
    if request.session.has_key('pincode'):
        del request.session['pincode']
    return redirect('index')


def addproduct(request):
    if request.method == 'POST':
        user = request.session['username']
        category = request.POST['category']
        productname = request.POST['pname']
        productprice = request.POST['pprice']
        productquantity = request.POST['pquantity']
        deliverycharge = request.POST['pdc']
        description = request.POST['pdesc']
        img1 = request.FILES['img1']
        status = 'pending'
        productbrand = request.POST['pb']
        vendorname = VendorDetails.objects.get(USERNAME=user)
        vname = vendorname.VendorName
        shopname = vendorname.ShopName
        ped = Product(VendorUsername=user, CATEGORY=category, ProductName=productname, ProductPrice=productprice,
                      ProductQuantity=productquantity, ProductDeliveryCharge=deliverycharge,
                      ProductDescription=description, ProductImage1=img1, ProductBrand=productbrand, Status=status,
                      VendorName=vname, ShopName=shopname)
        ped.save()
        messages.success(request, 'Product added Successfully and sent for approval to admin')
        return redirect('vendordashbord')


def vendor_order(request):
    user = request.session['username']
    status = ['Placed', 'Startprocessing', 'Dispatch']
    order = Orders.objects.all().filter(VendorUsername=user, Status__in=status)
    orders = Orders.objects.filter(VendorUsername=user, Status='Delivered')
    return render(request, 'vendor_order.html', {'user': user, 'orders': order, 'ord': orders})


def order_process(request):
    user = request.session['username']
    statu = request.POST.get('status')
    orderid = request.POST.get('orderid')
    status = Orders.objects.get(id=orderid, VendorUsername=user)
    status.Status = statu
    status.save()
    return redirect('orders')


def vendor_details(request):
    # return redirect('vendordashbord')
    if request.method == 'POST':
        sn = request.POST['sname']
        vn = request.POST['vname']
        contno = request.POST['cn']
        email = request.POST['email']
        sadd = request.POST['sadd']
        abouts = request.POST['abs']
        gstno = request.POST['gst']
        licenseno = request.POST['ln']
        pincode = request.POST['pincode']
        # sp1 = request.FILES['sp1']
        # sp2 = request.FILES['sp2']
        user = request.session['username']
        status = 'pending'

        vd = VendorDetails(USERNAME=user, ShopName=sn, ContactNo=contno, Email=email, ShopAddress=sadd,
                           AboutShop=abouts, GSTNo=gstno, LicenseNo=licenseno, Status=status, Pincode=pincode,
                           VendorName=vn)
        vd.save()
        messages.success(request, 'Profile Successfully Sent to admin for verification and admin send email for your '
                                  'status')
        return redirect('index')
    else:
        return render(request, 'vendor_profile.html')


def vendor_category_request(request):
    if request.session.has_key('username'):
        user = request.session['username']
        role = request.session['role']
        if request.method == 'POST':
            category = request.POST['category']
            status = 'requested'
            cat = Category(CATEGORY=category, Status=status, categoryby=user)
            cat.save()
            messages.success(request, 'Request sent successfully to admin for category add')
            return render(request, 'vendor_category_request.html', {'user': user, 'role': role})
        else:
            return render(request, 'vendor_category_request.html', {'user': user, 'role': role})
    else:
        return render(request, 'login.html')


def products(request):
    """Method for Product Display"""
    # category = request.GET.get('category')
    if request.method == 'POST':
        category = request.POST.get('cat')
    else:
        category = request.session['category']
    status = 'approve'
    if request.session.has_key('username'):
        user = request.session['username']
        role = request.session['role']
        pin = Login.objects.get(USERNAME=user)
        pincode = pin.PINCODE
        vendor = VendorDetails.objects.all().filter(Pincode=pincode).values_list('USERNAME', flat=True)
        getproduct = Product.objects.all().filter(CATEGORY=category, Status=status, VendorUsername__in=vendor)
        return render(request, 'products.html', {'product': getproduct, 'user': user, 'role': role})
    # pin = Login.objects.get(USERNAME=user)
    # pinn = pin.PINCODE
    getproduct = Product.objects.all().filter(CATEGORY=category, Status=status)
    return render(request, 'products.html', {'product': getproduct})


def addtocart(request):
    if request.session.has_key('username'):
        pro = request.POST.get('product')
        request.session['category'] = request.POST['category']
        remove = request.POST.get('remove')
        cart = request.session.get('cart')
        if cart:
            quen = cart.get(pro)
            if quen:
                if remove:
                    if quen <= 1:
                        cart.pop(pro)
                    else:
                        cart[pro] = quen - 1
                else:
                    cart[pro] = quen + 1
            else:
                cart[pro] = 1
        else:
            cart = {}
            cart[pro] = 1

        request.session['cart'] = cart
        return redirect('products')
    else:
        return render(request, 'login.html')


def cart(request):
    if request.session.has_key('username'):
        user = request.session['username']
        role = request.session['role']
        if request.session.has_key('cart'):
            ids = list(request.session.get('cart').keys())
            product = Product.objects.filter(id__in=ids)
            return render(request, 'cart.html', {'products': product, 'user': user, 'role': role})
        else:
            return render(request, 'cart.html', {'user': user, 'role': role})
    else:
        return render(request, 'login.html')


def quantity_update(request):
    pro = request.POST.get('product')
    remove = request.POST.get('remove')
    cart = request.session.get('cart')
    quen = cart.get(pro)
    if remove:
        if quen <= 1:
            cart.pop(pro)
        else:
            cart[pro] = quen - 1
    else:
        cart[pro] = quen + 1

    request.session['cart'] = cart
    return redirect('cart')


def checkout(request):
    if request.method == 'POST':
        customerusername = request.session['username']
        customername = request.POST.get('name')
        customeraddress = request.POST.get('add')
        customerphone = request.POST.get('phone')
        customeremail = request.POST.get('email')
        cart = request.session.get('cart')
        status = 'Placed'
        products = Product.objects.filter(id__in=list(cart.keys()))
        for product in products:
            vendorusername = product.VendorUsername
            vendoremail = VendorDetails.objects.get(USERNAME=vendorusername)
            shopname = VendorDetails.objects.get(USERNAME=vendorusername)
            order = Orders(CustomerUserName=customerusername, CustomerName=customername,
                           CustomerAddress=customeraddress, CustomerPhone=customerphone,
                           CustomerEmail=customeremail, VendorUsername=vendorusername,
                           VendorEmail=vendoremail.Email, ShopName=shopname.ShopName,
                           ProductId=product.id, ProductName=product.ProductName,
                           ProductQuantity=cart.get(str(product.id)), ProductPrice=product.ProductPrice,
                           ProductImage=product.ProductImage1, Status=status)
            order.save()

        request.session['cart'] = {}

        return redirect('cart')


def vendor_approve(request):
    vendor = request.GET.get('user')
    status = 'approve'
    app = VendorDetails.objects.get(USERNAME=vendor)
    ven = Login.objects.get(USERNAME=vendor)
    ven.ROLE = 'vendor'
    ven.save()
    app.Status = status
    email = app.Email
    message = 'Dear ' + vendor + ',\n\t Your Vendor Account Has been approve by Admin Now You can start your business ' \
                                 'throw LocalForVocalBuzz.,\nNote:- Can not replay on this mail.'
    send_mail('Account Verified', message, settings.EMAIL_HOST_USER, [email], fail_silently=False)
    app.save()
    messages.error(request, 'Approval mail send successfully.....')
    return redirect('admindashbord')


def vendor_reject(request):
    vendor = request.GET.get('user')
    status = 'reject'
    app = VendorDetails.objects.get(USERNAME=vendor)
    # app.Status = status
    email = app.Email

    message = 'Dear ' + vendor + ',\n\t Your Vendor Account Has been Reject by Admin of LocalForVocalBuzz.,' \
                                 '\nNote:- Can not replay on this mail.'
    send_mail('Account Rejected', message, settings.EMAIL_HOST_USER, [email], fail_silently=False)
    app.delete()
    messages.error(request, 'Rejection mail send successfully')
    return redirect('admindashbord')


def product_approve(request):
    product = request.GET.get('pro')
    status = 'approve'
    pro = Product.objects.get(id=product)
    pro.Status = status
    pro.Notification = '0'
    vendor = pro.VendorName
    usr = pro.VendorUsername
    em = VendorDetails.objects.get(USERNAME=usr)
    email = em.Email
    message = 'Dear ' + vendor + ',\n\t Your Vendor Product' + pro.ProductName + \
              ' Has been approve by Admin Now Your product display to user \n\nNote:- Can not replay on this mail.'
    send_mail('Product Approve', message, settings.EMAIL_HOST_USER, [email], fail_silently=False)
    pro.save()
    messages.success(request, 'product approve successfully..')
    return redirect('admindashbord')


def product_reject(request):
    product = request.GET.get('pro')
    pro = Product.objects.get(id=product)
    pro.Status = 'reject'
    pro.Notification = '0'
    ven = pro.VendorName
    usr = pro.VendorUsername
    em = VendorDetails.objects.get(USERNAME=usr)
    email = em.Email
    message = 'Dear ' + ven + ',\n\t Your Vendor Product' + pro.ProductName + \
              ' Has been Reject by Admin Now Your product display to user \n\nNote:- Can not replay on this mail.'
    send_mail('Product Reject', message, settings.EMAIL_HOST_USER, [email], fail_silently=False)
    pro.save()
    messages.success(request, ' product reject successfully..')
    return redirect('admindashbord')


def user_orders(request):
    if request.session.has_key('username'):
        user = request.session['username']
        role = request.session['role']
        order = Orders.objects.filter(CustomerUserName=user)
        return render(request, 'user_order.html', {'user': user, 'role': role, 'orders': order})
    else:
        return render(request, 'login.html')


def user_account(request):
    if request.session.has_key('username'):
        user = request.session['username']
        role = request.session['role']
        return render(request, 'user_account.html', {'user': user, 'role': role})
    else:
        return render(request, 'login.html')


def admin_account(request):
    if request.session.has_key('username'):
        user = request.session['username']
        role = request.session['role']
        return render(request, 'admin_account.html', {'user': user, 'role': role})
    else:
        return render(request, 'login.html')


def changepassword(request):
    """ Method for changepassword """
    if request.session.has_key('username'):
        user = request.session['username']
        role = request.session['role']
        opsw = request.POST['opsw']
        nopsw = hashlib.md5(str.encode(opsw)).hexdigest()

        npsw = request.POST['npsw']
        cpsw = request.POST['cpsw']
        sql = Login.objects.filter(USERNAME=user, PASSWORD=nopsw)
        if sql.count() > 0:
            if npsw == cpsw:
                nnpsw = hashlib.md5(str.encode(npsw)).hexdigest()
                chpsw = Login.objects.get(USERNAME=user)
                chpsw.PASSWORD = nnpsw
                chpsw.save()
                messages.error(request, 'Password Updated')
                if role == 'vendor':
                    return redirect('vendor_account')
                else:
                    return redirect('user_account')
            else:
                messages.error(request, 'Password and Confirm Password are not match')
                if role == 'vendor':
                    return redirect('vendor_account')
                else:
                    return redirect('user_account')
        else:
            messages.error(request, 'Old password not match')
            if role == 'vendor':
                return redirect('vendor_account')
            else:
                return redirect('user_account')
    else:
        return redirect('login')


def vendor_account(request):
    if request.session.has_key('username'):
        user = request.session['username']
        role = request.session['role']
        vendor = VendorDetails.objects.filter(USERNAME=user)
        return render(request, 'vendor_account.html', {'user': user, 'role': role, 'vendor': vendor})
    else:
        return redirect('login')


def forgot_password(request):
    """ Method for forgot password """
    if request.method == 'POST':
        user = request.POST['username']
        if Login.objects.filter(USERNAME=user).exists():
            sent = Login.objects.get(USERNAME=user)
            email = sent.EMAILID

            # generate 6 digit random string
            string = '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcefghijklmnopqrstuvwxyz'
            lent = len(string)
            otp = ""
            for i in range(6):
                otp += string[math.floor(random.random() * lent)]

            password = otp

            message = 'Dear ' + user + ',\n\t Your Password is: ' + otp + '\nNote:- Can not replay on this mail'

            password = hashlib.md5(str.encode(password)).hexdigest()

            pupdate = Login.objects.get(USERNAME=user)
            pupdate.PASSWORD = password
            pupdate.save()

            send_mail('VocalForLocal Buzz forgot password mail', message, settings.EMAIL_HOST_USER, [email],
                      fail_silently=False)
            messages.error(request, 'Password send successfully.. on ' + email)
            return redirect('login')
        else:
            messages.error(request, 'username is not registered..   Please register then login')
            return redirect('forgot_password')
    return render(request, 'forgot_password.html')


def category_approve(request):
    if request.method == 'POST':
        catid = request.POST['cat']
        status = 'approve'
        c = Category.objects.get(id=catid)
        c.Status = status
        us = c.categoryby
        em = VendorDetails.objects.get(USERNAME=us)
        email = em.Email
        vendor = em.VendorName
        message = 'Dear ' + vendor + ',\n\t Your Vendor Category' + c.CATEGORY + \
                  ' Has been approve by Admin Now You can add product in this category ' \
                  '\n\nNote:- Can not replay on this mail.'
        send_mail('Category Approve', message, settings.EMAIL_HOST_USER, [email], fail_silently=False)
        c.save()
        messages.success(request, 'Category approved successful')
        return redirect('admin_category')


def category_reject(request):
    if request.method == 'POST':
        catid = request.POST['cat']
        status = 'reject'
        c = Category.objects.get(id=catid)
        c.Status = status
        us = c.categoryby
        em = VendorDetails.objects.get(USERNAME=us)
        email = em.Email
        vendor = em.VendorName
        message = 'Dear ' + vendor + ',\n\t Your Vendor Category' + c.CATEGORY + \
                  ' Has been Reject by Admin \n\nNote:- Can not replay on this mail.'
        send_mail('Category Approve', message, settings.EMAIL_HOST_USER, [email], fail_silently=False)
        c.save()
        messages.success(request, 'Category reject successful')
        return redirect('admin_category')


def help_user(request):
    user = request.session['username']
    role = request.session['role']
    if request.method == 'POST':
        sub = request.POST['sub']
        des = request.POST['des']
        status = 'pending'
        hel = Help(name=user, subject=sub, description=des, status=status)
        hel.save()
        if role == 'vendor':
            messages.success(request, 'your query successfully sent to admin and admin sent response trow mail')
            return redirect('vendordashbord')
        else:
            messages.success(request, 'your query successfully sent to admin and admin sent response trow mail')
            return redirect('index')
    else:
        return render(request, 'help.html', {'user': user, 'role': role})


def admin_query(request):
    if request.session.has_key('username'):
        user = request.session['username']
        role = request.session['role']
        hel = Help.objects.all().filter(status='pending')
        if request.method == 'POST':
            id = request.POST['disid']
            ans = request.POST['des']
            us = request.POST['user']
            subject = request.POST['sub']
            em = Login.objects.get(USERNAME=us)
            ema = em.EMAILID
            sta = Help.objects.get(id=id)
            sta.status = 'resolve'
            sta.save()
            message = 'Dear ' + us + ',\n\t Your Query subject is: ' + subject + '\n\t solution is: ' + ans +\
                      '\nNote:- Can not replay on this mail'
            send_mail('VocalForLocal Buzz query resolve', message, settings.EMAIL_HOST_USER, [ema],
                      fail_silently=False)
            messages.error(request, 'Answer send successfully..')
        return render(request, 'admin_queries.html', {'user': user, 'role': role, 'help': hel})
    else:
        return render(request, 'login.html')


def close_notification(request):
    pid = request.GET.get('proid')
    noti = Product.objects.get(id=pid)
    noti.Notification = '1'
    noti.save()
    return redirect('vendordashbord')
