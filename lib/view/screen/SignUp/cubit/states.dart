
abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {}

class RegisterErrorState extends RegisterStates {}

class ChangingText extends RegisterStates {}

class ChangedText extends RegisterStates {}

class ShownPassword extends RegisterStates {}

class NotShownPassword extends RegisterStates {}
