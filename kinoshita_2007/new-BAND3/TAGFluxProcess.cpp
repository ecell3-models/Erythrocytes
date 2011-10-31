#include "libecs.hpp"
#include "Util.hpp"
#include "PropertyInterface.hpp"
#include "ContinuousProcess.hpp"
#include "System.hpp"
#include "Process.hpp"
#include "iostream.h"

#include "Stepper.hpp"

USE_LIBECS;
 
LIBECS_DM_CLASS( TAGFluxProcess, ContinuousProcess )
{
  
 public:
  
  LIBECS_DM_OBJECT( TAGFluxProcess, Process ){
    
    INHERIT_PROPERTIES( Process );
    
    PROPERTYSLOT_SET_GET( Real,base  );
    
    
  }
  
  TAGFluxProcess()
    :
    base(0.0)
    {
      ; // do nothing
    }
  SIMPLE_SET_GET_METHOD( Real,base);
  

  virtual void initialize(){
    
    Process::initialize();
    
    E0 = getVariableReference( "E0" );
    E1 = getVariableReference( "E1" );
    count = 0;
    
  }
  
  virtual void fire(){

    Real PO2 = E0.getVariable()->getValue();  
    Real TAG = E1.getVariable()->getValue();

    //    Real baseline = base + (1e-5);
    Real baseline = base + (1e-2);


    if ( count == 0 )
      {
	if ( PO2 > baseline ) TAG = 0;
	else
	  {
	    TAG = 0;
	    count = 1;
	  }
      }
    else
      {
	//	if ( PO2 < 100-(1e-5) ) TAG = 1;
	if ( PO2 < 100+(1e-2) ) TAG = 1;
	else
	  {
	    TAG = 1;
	    count = 0;
	  }
      }

    E1.getVariable()->setValue(TAG);

  }
  
 protected:
  
  VariableReference E0;
  VariableReference E1;
  Real count;
  Real base;

};

LIBECS_DM_INIT( TAGFluxProcess, Process);


