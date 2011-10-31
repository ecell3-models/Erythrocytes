#include "libecs.hpp"
#include "Util.hpp"
#include "PropertyInterface.hpp"

#include "System.hpp"

#include "ContinuousProcess.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( AdenylateChargeFluxProcess, ContinuousProcess )
{

 public:

  LIBECS_DM_OBJECT( AdenylateChargeFluxProcess, Process )
    {
      INHERIT_PROPERTIES( Process );
    }

  virtual void initialize()
    {
      Process::initialize();
      E0 = getVariableReference( "E0" );
      E1 = getVariableReference( "E1" );
      E2 = getVariableReference( "E2" );
      E3 = getVariableReference( "E3" );
      E4 = getVariableReference( "E4" );
      E5 = getVariableReference( "E5" );      
      E6 = getVariableReference( "E6" );
      E7 = getVariableReference( "E7" );
      E8 = getVariableReference( "E8" );
      E9 = getVariableReference( "E9" );
      E10 = getVariableReference( "E10" );
      E11 = getVariableReference( "E11" );
      E12 = getVariableReference( "E12" );
      E13 = getVariableReference( "E13" );
      E14 = getVariableReference( "E14" );
      E15 = getVariableReference( "E15" );
      E16 = getVariableReference( "E16" );
      E17 = getVariableReference( "E17" );

    }
  
  virtual void fire()
    {
      
      Real velocity = 0;
      Real tATP = E0.getMolarConc()+E1.getMolarConc()+E2.getMolarConc()+E3.getMolarConc()+E4.getMolarConc()+E5.getMolarConc()+ E12.getMolarConc()+E13.getMolarConc()+ E15.getMolarConc()+E16.getMolarConc();

      Real tADP = E6.getMolarConc()+E7.getMolarConc()+E8.getMolarConc()+E9.getMolarConc()+E14.getMolarConc()+E17.getMolarConc();
      Real tAMP = E10.getMolarConc()+E11.getMolarConc();
      
      
      velocity = (((tATP)+0.5*(tADP))/(tATP + tADP + tAMP));
      /**getSuperSystem()->getSize() * N_A;*/
      
      setFlux( velocity );
  
    }


protected:

VariableReference E0;
VariableReference E1;
VariableReference E2;
VariableReference E3;
VariableReference E4;
VariableReference E5;
VariableReference E6;
VariableReference E7;
VariableReference E8;
VariableReference E9;
VariableReference E10;
VariableReference E11;
VariableReference E12;
VariableReference E13;
VariableReference E14;
VariableReference E15;
VariableReference E16;
VariableReference E17;



};

LIBECS_DM_INIT( AdenylateChargeFluxProcess, Process );
