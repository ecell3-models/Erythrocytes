#include "libecs.hpp"

#include "ContinuousProcess.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( MichaelisBiBiFluxProcess, ContinuousProcess )
{

 public:

  LIBECS_DM_OBJECT( MichaelisBiBiFluxProcess, Process )
    {
      INHERIT_PROPERTIES( ContinuousProcess );

      PROPERTYSLOT_SET_GET( Real, KmA );
      PROPERTYSLOT_SET_GET( Real, KmB );
      PROPERTYSLOT_SET_GET( Real, Vm );
    }
  


  MichaelisBiBiFluxProcess()
    :
    KmA( 1.0 ),
    KmB( 1.0 ),
    Vm( 0.0 )
    {
      // do nothing
    }
  
  SIMPLE_SET_GET_METHOD( Real, KmA );
  SIMPLE_SET_GET_METHOD( Real, KmB );
  SIMPLE_SET_GET_METHOD( Real, Vm );
    
  virtual void initialize()
    {
      Process::initialize();
      
      S0 = getVariableReference( "S0" );
      S1 = getVariableReference( "S1" );
      C0 = getVariableReference( "C0" );
      E0 = getVariableReference( "E0" );
    }

 virtual void fire()
    {
      Real velocity = C0.getValue();
      velocity *= Vm* N_A * S0.getVariable()->getSuperSystem()->getSize();
      Real Sa =  1000* S0.getMolarConc() ;
      Real Sb =  1000* S1.getMolarConc();
      velocity *= ( Sa / ( KmA + Sa )) * ( Sb / ( KmB + Sb )); 
      velocity *= E0.getValue()/1000/1000/3600;

      setFlux( velocity );
    }

 protected:
  

  Real KmA;
  Real KmB;
  Real Vm;

  VariableReference S0;
  VariableReference S1;
  VariableReference E0;
  VariableReference C0;
  
};

LIBECS_DM_INIT( MichaelisBiBiFluxProcess, Process );
