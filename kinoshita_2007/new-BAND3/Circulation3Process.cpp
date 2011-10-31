#include "libecs.hpp"
#include "Process.hpp"
#include "Stepper.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( Circulation3Process, Process )
{

 public:
  
  LIBECS_DM_OBJECT( Circulation3Process, Process ){

    INHERIT_PROPERTIES( Process );
 
  }

  Circulation3Process()
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

    int i = getStepper()->getCurrentTime() /11.0;
    theCalcTime = getStepper()->getCurrentTime() - 7.5 * i;
    
    if (getStepper()->getCurrentTime() > 11.0){
       PO2= E0.getVariable()->getValue();
       std::cout<<getStepper()->getCurrentTime()<<std::endl;
    }

    else{
      if (0 < theCalcTime <=0.36)
	PO2 = 186.1111 * theCalcTime + 30;

      else if(theCalcTime <= 2.55)
	PO2 = 97;

      
      else if(theCalcTime < 11.0)
	PO2 = 60 - 32 * (theCalcTime - 2.57)/(0.5 + (theCalcTime - 2.57));

    }
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

LIBECS_DM_INIT( Circulation3Process, Process );


