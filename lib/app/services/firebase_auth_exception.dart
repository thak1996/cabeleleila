class CustomFirebaseAuthException implements Exception {
  CustomFirebaseAuthException(this.message);
  final String message;

  @override
  String toString() => message;

  static fromFirebaseAuthException(e) {
  String message;
  if (e.code == 'weak-password') {
    message = 'Senha muito fraca';
  } else if (e.code == 'email-already-in-use') {
    message = 'E-mail já está sendo usado em outra conta';
  } else if (e.code == 'invalid-email') {
    message = 'Endereço de e-mail inválido';
  } else if (e.code == 'user-not-found') {
    message = 'Nenhum usuário encontrado com este e-mail';
  } else if (e.code == 'wrong-password') {
    message = 'Senha incorreta';
  } else if (e.code == 'invalid-credential') {
    message = 'As credenciais fornecidas são inválidas ou expiraram';
  } else if (e.code == 'user-disabled') {
    message = 'Esta conta de usuário foi desativada';
  } else if (e.code == 'operation-not-allowed') {
    message = 'A autenticação com e-mail e senha não está habilitada';
  } else if (e.code == 'too-many-requests') {
    message = 'Muitas solicitações enviadas para o servidor. Tente novamente mais tarde';
  } else if (e.code == 'requires-recent-login') {
    message = 'Esta operação requer autenticação recente. Faça login novamente antes de tentar novamente';
  } else if (e.code == 'provider-already-linked') {
    message = 'A conta do provedor de autenticação já está vinculada a este usuário';
  } else if (e.code == 'no-such-provider') {
    message = 'O provedor de autenticação não está configurado ou não existe para este ID de projeto';
  } else if (e.code == 'invalid-verification-code') {
    message = 'Código de verificação inválido';
  } else if (e.code == 'invalid-verification-id') {
    message = 'ID de verificação inválido';
  } else {
    message = 'Ocorreu um erro ao tentar fazer login';
  }
  return CustomFirebaseAuthException(message);
}

}
