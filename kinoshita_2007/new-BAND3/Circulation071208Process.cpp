#include "libecs.hpp"
#include "Process.hpp"
#include "Stepper.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( Circulation071208Process, Process )
{

 public:
  
  LIBECS_DM_OBJECT( Circulation071208Process, Process ){

    INHERIT_PROPERTIES( Process );
 
  }

  Circulation071208Process()
    //    :
    {
      ; // do nothing
    }
  
  virtual void initialize(){
    
    Process::initialize();
    //    theCurrentTime = 0;
    theCalcTime = 0;

  }
  virtual void fire(){

    E0 = getVariableReference( "E0" );
    Real PO2 = E0.getVariable()->getValue();

    Real i = trunc( getStepper()->getCurrentTime() / 10.0 );
    theCalcTime = getStepper()->getCurrentTime() - 10.0 * i;
 

    //    if (0 < theCalcTime <=0.36)
    //	  PO2 = 186.1111 * theCalcTime + 30;
    //    else if(theCalcTime <= 2.55)
    //	  PO2 = 97;
    //    else if(theCalcTime < 5.5)
    //	  PO2 = 60 - 32 * (theCalcTime - 2.57)/(0.15 + (theCalcTime - 2.57));

    if(0 < theCalcTime <= 0.10)
      PO2 = 50 + (500 * theCalcTime);

    else if( theCalcTime <= 1.00 )
      PO2 = 100;

    else if( theCalcTime <= 3.00 )
      PO2 = 100 - ( 87.5 * (theCalcTime-1.00) /( 0.5 + (theCalcTime - 1.00)));

    else if( theCalcTime <= 5.00 )
      PO2 = 30 +  5.00* (theCalcTime - 3.00)*(theCalcTime - 3.00);

    E0.getVariable()->setValue( PO2 ); 

  }

 protected:
  
  Real theCalcTime;
  VariableReference E0;

};

LIBECS_DM_INIT( Circulation071208Process, Process );


