#include "libecs.hpp"
#include "Util.hpp"
#include "PropertyInterface.hpp"

#include "System.hpp"

#include "ContinuousProcess.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( UniUniBPGSP6FluxProcess, ContinuousProcess )
{

 public:

  LIBECS_DM_OBJECT( UniUniBPGSP6FluxProcess, Process )
    {
      INHERIT_PROPERTIES( Process );

      PROPERTYSLOT_SET_GET( Real, k10 );
      PROPERTYSLOT_SET_GET( Real, k11 );
    }


  SIMPLE_SET_GET_METHOD( Real, k10 );
  SIMPLE_SET_GET_METHOD( Real, k11 );

  virtual void initialize()
  {
    Process::initialize();

    S0 = getVariableReference( "S0" );
    P0 = getVariableReference( "P0" );
    
  }  
  
  virtual void fire()
  {
    Real velocity = k10 * S0.getMolarConc() - k11 * P0.getMolarConc();

    velocity = velocity * getSuperSystem()->getSize() * N_A;

    setFlux( velocity );

  }

 protected:

  VariableReference S0;
  VariableReference P0;

  Real k10;
  Real k11;

};

LIBECS_DM_INIT( UniUniBPGSP6FluxProcess, Process );
