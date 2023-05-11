class CustomFirebaseAuthException implements Exception {
  CustomFirebaseAuthException(this.message);

  final String message;

  @override
  String toString() => message;

  static CustomFirebaseAuthException fromFirebaseAuthException(e) {
    String message = 'Ocorreu um erro ao tentar fazer login';
    final String code = e.code;

    switch (code) {
      case 'weak-password':
        message = 'Senha muito fraca';
        break;
      case 'email-already-in-use':
        message = 'E-mail já está sendo usado em outra conta';
        break;
      case 'invalid-email':
        message = 'Endereço de e-mail inválido';
        break;
      case 'user-not-found':
        message = 'Nenhum usuário encontrado com este e-mail';
        break;
      case 'wrong-password':
        message = 'Senha incorreta';
        break;
      case 'invalid-credential':
        message = 'As credenciais fornecidas são inválidas ou expiraram';
        break;
      case 'user-disabled':
        message = 'Esta conta de usuário foi desativada';
        break;
      case 'operation-not-allowed':
        message = 'A autenticação com e-mail e senha não está habilitada';
        break;
      case 'too-many-requests':
        message =
            'Muitas solicitações enviadas para o servidor. Tente novamente mais tarde';
        break;
      case 'requires-recent-login':
        message =
            'Esta operação requer autenticação recente. Faça login novamente antes de tentar novamente';
        break;
      case 'provider-already-linked':
        message =
            'A conta do provedor de autenticação já está vinculada a este usuário';
        break;
      case 'no-such-provider':
        message =
            'O provedor de autenticação não está configurado ou não existe para este ID de projeto';
        break;
      case 'invalid-verification-code':
        message = 'Código de verificação inválido';
        break;
      case 'invalid-verification-id':
        message = 'ID de verificação inválido';
        break;
    }
    return CustomFirebaseAuthException(message);
  }
}
