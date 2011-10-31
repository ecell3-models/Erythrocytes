#include "libecs.hpp"
#include "Process.hpp"
#include "Stepper.hpp"
#include "ContinuousProcess.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( VariableVolumeProcess, ContinuousProcess )
{
  
 public:
  
  LIBECS_DM_OBJECT( VariableVolumeProcess, Process )
    {
      INHERIT_PROPERTIES( Process );
    }

  virtual void initialize()
    {
      Process::initialize();
      
      E0 = getVariableReference( "E0" );
      
    }
  
  virtual void fire()
    {
      
      Real volume = E0.getVariable()->getValue();
      volume *= 1e-24;
      
      Real aStepInterval( getStepper()->getStepInterval() );
      volume *= aStepInterval;
      
      setFlux( volume );

    }

    protected:
      
      VariableReference E0;
  
};

LIBECS_DM_INIT( VariableVolumeProcess, Process );
