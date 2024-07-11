import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> sigup(CreateUserReq createUserReq);

  Future<void> sigin();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<void> sigin() {
    // TODO: implement sigin
    throw UnimplementedError();
  }

  @override
  Future<Either> sigup(CreateUserReq createUserReq) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );

      return const Right('A new was created successfully');
    } on FirebaseAuthException catch (e) {
      String message = '';

      if (e.code == 'weak-password') {
        message = 'The provided password is weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with this email. Please try with a different email.';
      } else {
        message = 'An error occurs while registering. Please try again.';
      }

      return Left(message);
    }
  }
}
