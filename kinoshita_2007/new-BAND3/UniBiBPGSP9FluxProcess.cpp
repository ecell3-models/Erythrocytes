#include "libecs.hpp"
#include "Util.hpp"
#include "PropertyInterface.hpp"

#include "System.hpp"

#include "ContinuousProcess.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( UniBiBPGSP9FluxProcess, ContinuousProcess )
{

 public:

  LIBECS_DM_OBJECT( UniBiBPGSP9FluxProcess, Process )
    {
      INHERIT_PROPERTIES( Process );

      PROPERTYSLOT_SET_GET( Real, k16 );
    }

  SIMPLE_SET_GET_METHOD( Real, k16 );

  virtual void initialize()
  {
    Process::initialize();

    S0 = getVariableReference( "S0" );
  }  
  
  virtual void fire()
  {
    Real velocity = k16 * S0.getMolarConc();

    velocity = velocity * getSuperSystem()->getSize() * N_A;

    setFlux( velocity );

  }

 protected:

  VariableReference S0;
  VariableReference E0;

  Real k16;

};

LIBECS_DM_INIT( UniBiBPGSP9FluxProcess, Process );
