#include "libecs.hpp"
#include "Util.hpp"
#include "PropertyInterface.hpp"

#include "System.hpp"

#include "ContinuousProcess.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( UniUniOXFluxProcess, ContinuousProcess )
{

 public:

  LIBECS_DM_OBJECT( UniUniOXFluxProcess, Process )
    {
      INHERIT_PROPERTIES( Process );

      PROPERTYSLOT_SET_GET( Real, k );
    }


  SIMPLE_SET_GET_METHOD( Real, k );


  virtual void initialize()
  {
    Process::initialize();

    S0 = getVariableReference( "S0" );

  }  
  
  virtual void fire()
  {
    Real velocity = k * S0.getMolarConc();

    velocity = velocity * getSuperSystem()->getSize() * N_A;

    setFlux( velocity );

  }

 protected:

  Real k;

  VariableReference S0;

};

LIBECS_DM_INIT( UniUniOXFluxProcess, Process );
