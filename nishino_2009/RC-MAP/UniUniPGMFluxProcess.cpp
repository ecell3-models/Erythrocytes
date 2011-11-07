#include "libecs.hpp"
#include "Util.hpp"
#include "PropertyInterface.hpp"

#include "System.hpp"

#include "ContinuousProcess.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( UniUniPGMFluxProcess, ContinuousProcess )
{

 public:

  LIBECS_DM_OBJECT( UniUniPGMFluxProcess, Process )
    {
      INHERIT_PROPERTIES( Process );

      PROPERTYSLOT_SET_GET( Real, KmP3GA );
      PROPERTYSLOT_SET_GET( Real, KmP2GA );
      PROPERTYSLOT_SET_GET( Real, PGM );
      PROPERTYSLOT_SET_GET( Real, kcatf );
      PROPERTYSLOT_SET_GET( Real, kcatr );

    }

  SIMPLE_SET_GET_METHOD( Real, KmP3GA );
  SIMPLE_SET_GET_METHOD( Real, KmP2GA );
  SIMPLE_SET_GET_METHOD( Real, PGM );
  SIMPLE_SET_GET_METHOD( Real, kcatf );
  SIMPLE_SET_GET_METHOD( Real, kcatr );

  virtual void initialize()
  {
    Process::initialize();

    S0 = getVariableReference( "S0" );
    P0 = getVariableReference( "P0" );
    E0 = getVariableReference( "E0" );

  }  
  
  virtual void fire()
  {

    Real pgmrd = 1 + ( S0.getMolarConc() / KmP3GA ) + 
      ( P0.getMolarConc() / KmP2GA );
    
    Real velocity = ( PGM / pgmrd ) * 
      ( ( ( kcatf * S0.getMolarConc() ) / KmP3GA ) -
	( ( kcatr * P0.getMolarConc() ) / KmP2GA ) ); 

    velocity = velocity * getSuperSystem()->getSize() * N_A;

    velocity = velocity * E0.getValue()/ 1000;

    setFlux( velocity );

  }

 protected:

  Real KmP3GA;
  Real KmP2GA;
  Real PGM;
  Real kcatf;
  Real kcatr;

  VariableReference S0;
  VariableReference P0;
  VariableReference E0;

};

LIBECS_DM_INIT( UniUniPGMFluxProcess, Process );
