import 'package:cleanarchwithprovider/services/departments_service/departments_service_impl.dart';
import 'package:cleanarchwithprovider/services/login_service/login_service_impl.dart';
import 'package:cleanarchwithprovider/services/users_service/users_service_impl.dart';

class ServiceFactory {
  static final ServiceFactory _serviceFactory = ServiceFactory._internal();

  factory ServiceFactory() {
    return _serviceFactory;
  }

  ServiceFactory._internal();

  LoginApiServiceImpl get loginApiService {
    return LoginApiServiceImpl();
  }

  DepartmentApiServiceImpl get departmentApiService {
    return DepartmentApiServiceImpl();
  }

  UsersApiServiceImpl get userApiService {
    return UsersApiServiceImpl();
  }
}
