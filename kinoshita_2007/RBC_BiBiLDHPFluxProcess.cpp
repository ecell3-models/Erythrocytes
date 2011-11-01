#include "libecs.hpp"
#include "Util.hpp"
#include "PropertyInterface.hpp"

#include "System.hpp"

#include "ContinuousProcess.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( RBC_BiBiLDHPFluxProcess, ContinuousProcess )
{

 public:

  LIBECS_DM_OBJECT( RBC_BiBiLDHPFluxProcess, Process )
    {
      INHERIT_PROPERTIES( Process );

      PROPERTYSLOT_SET_GET( Real, KmPyr );
      PROPERTYSLOT_SET_GET( Real, KmLac );
      PROPERTYSLOT_SET_GET( Real, kf );
      PROPERTYSLOT_SET_GET( Real, kr );
    }


  SIMPLE_SET_GET_METHOD( Real, KmPyr );
  SIMPLE_SET_GET_METHOD( Real, KmLac );
  SIMPLE_SET_GET_METHOD( Real, kf );
  SIMPLE_SET_GET_METHOD( Real, kr );


  virtual void initialize()
  {
    Process::initialize();

    S0 = getVariableReference( "S0" );
    S1 = getVariableReference( "S1" );
    P0 = getVariableReference( "P0" );
    P1 = getVariableReference( "P1" );
    E0 = getVariableReference( "E0" );

  }  
  
  virtual void fire()
  {
    Real ldhprd = 1 + ( S0.getMolarConc() / KmPyr ) +
      ( P0.getMolarConc() / KmLac );
    
    Real velocity  = ( 1/ ldhprd ) * 
      ( ( ( kf * S0.getMolarConc() * S1.getMolarConc() ) / KmPyr ) -
	( ( kr * P0.getMolarConc() * P1.getMolarConc() ) / KmLac ) );

    velocity = E0.getValue() * velocity * getSuperSystem()->getSize() * N_A / 1000;

    setFlux( velocity );

  }

 protected:

  VariableReference S0;
  VariableReference E0;
  VariableReference S1;
  VariableReference P0;
  VariableReference P1;
  
  Real KmPyr;
  Real KmLac;
  Real kf;
  Real kr;

};

LIBECS_DM_INIT( RBC_BiBiLDHPFluxProcess, Process );











