#include "libecs.hpp"
#include "Util.hpp"
#include "PropertyInterface.hpp"

#include "System.hpp"

#include "ContinuousProcess.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( BiUniHbBindingFluxProcess, ContinuousProcess )
{

 public:

  LIBECS_DM_OBJECT( BiUniHbBindingFluxProcess, Process )
    {
      INHERIT_PROPERTIES( Process );

      PROPERTYSLOT_SET_GET( Real, Kahb );
      PROPERTYSLOT_SET_GET( Real, ka );
      PROPERTYSLOT_SET_GET( Real, kd );
    }

  SIMPLE_SET_GET_METHOD( Real, Kahb );
  SIMPLE_SET_GET_METHOD( Real, ka );
  SIMPLE_SET_GET_METHOD( Real, kd );

  virtual void initialize()
  {
    Process::initialize();

    S0 = getVariableReference( "S0" );
    S1 = getVariableReference( "S1" );
    P0 = getVariableReference( "P0" );
    E0 = getVariableReference( "E0" );
    E1 = getVariableReference( "E1" );

    Real hbphf = ( 1 + ( ( 2 * Kahb ) / pow( 10, -7.2 ) ) + 
		   pow( Kahb / pow( 10, -7.2 ), 2 ) ) /
      ( 1 + ( ( 2 * Kahb ) / pow( 10, -1 * E0.getValue() ) ) + 
	pow( Kahb / pow( 10, -1 * E0.getValue() ), 2 ) );

    theKa = ka * hbphf;
  }  
  
  virtual void fire()
  {

    Real velocity = theKa * S0.getMolarConc() * S1.getMolarConc() -
      kd * P0.getMolarConc();

    velocity = velocity * getSuperSystem()->getSize() * N_A;

    velocity = velocity * E1.getValue() / 1000;

    setFlux( velocity );

  }

 protected:

  Real theKa;

  VariableReference S0;
  VariableReference S1;
  VariableReference P0;
  VariableReference E0;
  VariableReference E1;

  Real Kahb;
  Real ka;
  Real kd;

};

LIBECS_DM_INIT( BiUniHbBindingFluxProcess, Process );
