import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';

abstract class AuthFirebaseService {
  Future<void> sigup(CreateUserReq createUserReq);

  Future<void> sigin();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<void> sigin() {
    // TODO: implement sigin
    throw UnimplementedError();
  }

  @override
  Future<void> sigup(CreateUserReq createUserReq) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );
    } on FirebaseAuthException catch (e) {}
  }
}
