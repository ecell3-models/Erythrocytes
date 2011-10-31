#include "libecs.hpp"
#include "Util.hpp"
#include "PropertyInterface.hpp"

#include "System.hpp"

#include "ContinuousProcess.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( AdenylateCharge_free_FluxProcess, ContinuousProcess )
{

 public:

  LIBECS_DM_OBJECT( AdenylateCharge_free_FluxProcess, Process )
    {
      INHERIT_PROPERTIES( Process );
    }

  virtual void initialize()
    {
      Process::initialize();
      E0 = getVariableReference( "E0" );
      E1 = getVariableReference( "E1" );
      E2 = getVariableReference( "E2" );

    }
  
  virtual void fire()
    {
      
      Real velocity = 0;
      Real fATP = E0.getMolarConc();
      Real fADP = E1.getMolarConc();
      Real fAMP = E2.getMolarConc();
      
      
      velocity = (((fATP)+0.5*(fADP))/(fATP + fADP + fAMP));
      /**getSuperSystem()->getSize() * N_A;*/
      
      setFlux( velocity );
  
    }


protected:

VariableReference E0;
VariableReference E1;
VariableReference E2;



};

LIBECS_DM_INIT( AdenylateCharge_free_FluxProcess, Process );
