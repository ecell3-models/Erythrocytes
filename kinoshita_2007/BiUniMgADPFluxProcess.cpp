#include "libecs.hpp"
#include "Util.hpp"
#include "PropertyInterface.hpp"

#include "System.hpp"

#include "ContinuousProcess.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( BiUniMgADPFluxProcess, ContinuousProcess )
{

 public:

  LIBECS_DM_OBJECT( BiUniMgADPFluxProcess, Process )
    {
      INHERIT_PROPERTIES( Process );

      PROPERTYSLOT_SET_GET( Real, Kmgadp );
      PROPERTYSLOT_SET_GET( Real, Khadp );
      PROPERTYSLOT_SET_GET( Real, Kmghadp );
      PROPERTYSLOT_SET_GET( Real, Kkadp );
      PROPERTYSLOT_SET_GET( Real, kmgadpa );
      PROPERTYSLOT_SET_GET( Real, kmgadpd );
    }

  SIMPLE_SET_GET_METHOD( Real, Kmgadp );
  SIMPLE_SET_GET_METHOD( Real, Khadp );
  SIMPLE_SET_GET_METHOD( Real, Kmghadp );
  SIMPLE_SET_GET_METHOD( Real, Kkadp );
  SIMPLE_SET_GET_METHOD( Real, kmgadpa );
  SIMPLE_SET_GET_METHOD( Real, kmgadpd );

  virtual void initialize()
  {
    Process::initialize();

    S0 = getVariableReference( "S0" );
    S1 = getVariableReference( "S1" );
    P0 = getVariableReference( "P0" );
    E0 = getVariableReference( "E0" );
    E1 = getVariableReference( "E1" );

    theKmgadpa = kmgadpa * 
      ( ( Kmgadp + ( pow( 10, -1 * E0.getValue() ) * Khadp * Kmghadp ) ) /
	( 1 + ( pow( 10, -1 * E0.getValue() ) * Khadp ) +  E1.getMolarConc() * Kkadp ) );

  }  
  
  virtual void fire()
  {

    Real velocity = theKmgadpa * S0.getMolarConc() * S1.getMolarConc() -
      kmgadpd * P0.getMolarConc();

    velocity = velocity * getSuperSystem()->getSize() * N_A;

    setFlux( velocity );

  }

 protected:

  Real theKmgadpa;

  VariableReference S0;
  VariableReference S1;
  VariableReference P0;
  VariableReference E0;
  VariableReference E1;

  Real Kmgadp;
  Real Khadp;
  Real Kmghadp;
  Real Kkadp;
  Real kmgadpa;
  Real kmgadpd;

};

LIBECS_DM_INIT( BiUniMgADPFluxProcess, Process );
