#include "libecs.hpp"
#include "Util.hpp"
#include "PropertyInterface.hpp"
#include "ContinuousProcess.hpp"
#include "System.hpp"
#include "Process.hpp"
#include "iostream.h"

#include "Stepper.hpp"

USE_LIBECS;
 
LIBECS_DM_CLASS( PO2Flux2Process, ContinuousProcess )
{
  
 public:
  
  LIBECS_DM_OBJECT( PO2Flux2Process, Process ){
    
    INHERIT_PROPERTIES( Process );

    PROPERTYSLOT_SET_GET( Real,k0  );
    PROPERTYSLOT_SET_GET( Real,k1  );
    PROPERTYSLOT_SET_GET( Real,base  );



  }
  
  PO2Flux2Process()
    :
    base(0.0),
    k0(0.0),
    k1(0.0)


    {
      ; // do nothing
    }
  
  SIMPLE_SET_GET_METHOD( Real,base  );
  SIMPLE_SET_GET_METHOD( Real,k0  );
  SIMPLE_SET_GET_METHOD( Real,k1  );

 

  virtual void initialize(){
    
    Process::initialize();
    
    S0 = getVariableReference( "S0" );
    P0 = getVariableReference( "P0" );
    E0 = getVariableReference( "E0" );

  }
  
  virtual void fire(){

    Real PO2 = S0.getVariable()->getValue();  
    Real dammy = P0.getVariable()->getValue();
    Real TAG   = E0.getVariable()->getValue();

    Real pk0;
    Real pk1;


    if ( TAG == 0 )
      {
	pk1=0;
	pk0=k0;
      }
    else
      {
	pk0=0;
	pk1=k1;
      }
    
    Real velocity = ((pk0 - pk1)*(PO2-base));
    
    setFlux(velocity);
 
  }
  
 protected:
  
  VariableReference S0;
  VariableReference P0;
  VariableReference E0;
  Real k0;
  Real k1;
  Real base;
};

LIBECS_DM_INIT( PO2Flux2Process, Process);


