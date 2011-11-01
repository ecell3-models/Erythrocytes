#include "libecs.hpp"
#include "Util.hpp"
#include "PropertyInterface.hpp"

#include "System.hpp"

#include "ContinuousProcess.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( UniUniBPGSP5FluxProcess, ContinuousProcess )
{

 public:

  LIBECS_DM_OBJECT( UniUniBPGSP5FluxProcess, Process )
    {
      INHERIT_PROPERTIES( Process );

      PROPERTYSLOT_SET_GET( Real, k8 );
      PROPERTYSLOT_SET_GET( Real, k9 );
    }


  SIMPLE_SET_GET_METHOD( Real, k8 );
  SIMPLE_SET_GET_METHOD( Real, k9 );

  virtual void initialize()
  {
    Process::initialize();

    S0 = getVariableReference( "S0" );
    P0 = getVariableReference( "P0" );
    
  }  
  
  virtual void fire()
  {
    Real velocity = k8* S0.getMolarConc() - k9 * P0.getMolarConc();

    velocity = velocity * getSuperSystem()->getSize() * N_A;

    setFlux( velocity );

  }

 protected:

  VariableReference S0;
  VariableReference P0;

  Real k8;
  Real k9;

};

LIBECS_DM_INIT( UniUniBPGSP5FluxProcess, Process );
