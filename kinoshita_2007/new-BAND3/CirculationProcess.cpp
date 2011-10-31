#include "libecs.hpp"
#include "Process.hpp"
#include "Stepper.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( CirculationProcess, Process )
{

 public:
  
  LIBECS_DM_OBJECT( CirculationProcess, Process ){

    INHERIT_PROPERTIES( Process );
 
  }

  CirculationProcess()
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
    //    theCurrentTime = getStepper()->getCurrentTime();   

    Real i = trunc( getStepper()->getCurrentTime() / 5.5 );
    theCalcTime = getStepper()->getCurrentTime() - 5.5 * i;
 

    if (0 < theCalcTime <=0.36)
	  PO2 = 186.1111 * theCalcTime + 30;

    else if(theCalcTime <= 2.55)
	  PO2 = 97;


    else if(theCalcTime < 5.5)
	  PO2 = 60 - 32 * (theCalcTime - 2.57)/(0.15 + (theCalcTime - 2.57));


    //    else if(theCalcTime == 5.5)
    //      {
	////      theCalcTime = 0;
    //	i= i+1;
    //      }

    //    std::cout << "i: " <<  i << std::endl;
    //   std::cout << "theCalcTime: " <<  theCalcTime << std::endl;

    E0.getVariable()->setValue( PO2 ); 

  }

 protected:
  
  //  Real theCurrentTime;
  Real theCalcTime;
  VariableReference E0;

};

LIBECS_DM_INIT( CirculationProcess, Process );


