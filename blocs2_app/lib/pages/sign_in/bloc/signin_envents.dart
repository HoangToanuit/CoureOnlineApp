abstract class SignInEvent{
  const SignInEvent();

}

class EmailEvent extends SignInEvent{
  final String email;
  const EmailEvent(this.email);
}

class PassWordEvent extends SignInEvent{
  final String password;
  const PassWordEvent(this.password);
}