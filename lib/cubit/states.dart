abstract class NewsStates{}

class NewInitialState extends NewsStates{}

class Changebottomnavigation  extends NewsStates{}

class NewLoadingbusinessstate  extends NewsStates{}

class NewgetBusinessDataSuccessfuly  extends NewsStates{}

class NewgetBusinessDataerrorsState  extends NewsStates
{
final String error;
NewgetBusinessDataerrorsState(this.error);

}

class NewLoadingsportsstate  extends NewsStates{}

class NewgetSportsDataSuccessfuly  extends NewsStates{}

class NewgetSportsDataerrorsState  extends NewsStates
{
  final String error;
  NewgetSportsDataerrorsState(this.error);

}

class NewLoadingsciencestate  extends NewsStates{}

class NewgetScienceDataSuccessfuly  extends NewsStates{}

class NewgetScienceDataerrorsState  extends NewsStates
{
  final String error;
  NewgetScienceDataerrorsState(this.error);

}

class AppChangeModeState  extends NewsStates{}

class NewLoadingsearchstate  extends NewsStates{}

class NewgetSearchDataSuccessfuly  extends NewsStates{}

class NewgetSearchDataerrorsState  extends NewsStates
{
  final String error;
  NewgetSearchDataerrorsState(this.error);

}