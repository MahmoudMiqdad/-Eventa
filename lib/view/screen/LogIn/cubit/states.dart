abstract class LogInState {}

class  LogInInitialState extends LogInState {}

class  LogInSuccessState extends LogInState {}

class  LogInLoadingState extends LogInState {}

class  LogInErrorState extends LogInState {}
class  LogInError404State extends LogInState {}

///

class ChangingText extends LogInState {}

class ChangedText extends LogInState {}

class ShownPassword extends LogInState {}

class NotShownPassword extends LogInState {}
