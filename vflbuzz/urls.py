from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('index', views.index, name='index'),
    path('login', views.login, name='login'),
    path('Register', views.register, name='Register'),
    path('vendor', views.vendordesh, name='vendordashbord'),
    path('addcategory', views.addcategory, name='addcategory'),
    path('editproduct', views.editproduct, name='editproduct'),
    path('logout', views.logout, name='logout'),
    path('addproduct', views.addproduct, name='addproduct'),
    path('orders', views.vendor_order, name='orders'),
    path('vendordetails', views.vendor_details, name='vendordetails'),
    path('vendor_category_request', views.vendor_category_request, name='vendor_category_request'),
    path('products', views.products, name='products'),
    path('admindeshbord', views.admindesh, name='admindashbord'),
    path('addcategory', views.addcategory, name='addcategory'),
    path('approve', views.vendor_approve, name='vendorapprove'),
    path('reject', views.vendor_reject, name='vendorreject'),
    path('category_reject', views.category_reject, name='category_reject'),
    path('category_approve', views.category_approve, name='category_approve'),
    path('pincode', views.pincode, name='pincode'),
    path('product_approve', views.product_approve, name='productapprove'),
    path('product_reject', views.product_reject, name='productreject'),
    path('addtocart', views.addtocart, name='addtocart'),
    path('cart', views.cart, name='cart'),
    path('checkout', views.checkout, name='checkout'),
    path('order_process', views.order_process, name='order_process'),
    path('admin_ctegory', views.admin_category, name='admin_category'),
    path('admin_order', views.admin_order, name='admin_order'),
    path('user_account', views.user_account, name='user_account'),
    path('user_orders', views.user_orders, name='user_orders'),
    path('quantity_update', views.quantity_update, name='quantity_update'),
    path('change_password', views.changepassword, name='change_password'),
    path('vendor_account', views.vendor_account, name='vendor_account'),
    path('admin_account', views.admin_account, name='admin_account'),
    path('forgot_password', views.forgot_password, name='forgot_password'),
    path('delete_product', views.delete_product, name='delete_product'),
    path('help', views.help_user, name='help'),
    path('queries', views.admin_query, name='queries'),
    path('close_notification', views.close_notification, name='close_notification'),
    path('vendor_product_display', views.vendor_product_display, name='vendor_product_display')
]
