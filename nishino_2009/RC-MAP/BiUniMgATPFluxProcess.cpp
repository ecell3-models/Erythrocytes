#include "libecs.hpp"
#include "Util.hpp"
#include "PropertyInterface.hpp"

#include "System.hpp"

#include "ContinuousProcess.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( BiUniMgATPFluxProcess, ContinuousProcess )
{

 public:

  LIBECS_DM_OBJECT( BiUniMgATPFluxProcess, Process )
    {
      INHERIT_PROPERTIES( Process );

      PROPERTYSLOT_SET_GET( Real, Kmgatp );
      PROPERTYSLOT_SET_GET( Real, Khatp );
      PROPERTYSLOT_SET_GET( Real, Kmghatp );
      PROPERTYSLOT_SET_GET( Real, Kkatp );
      PROPERTYSLOT_SET_GET( Real, kmgatpa );
      PROPERTYSLOT_SET_GET( Real, kmgatpd );
    }

  SIMPLE_SET_GET_METHOD( Real, Kmgatp );
  SIMPLE_SET_GET_METHOD( Real, Khatp );
  SIMPLE_SET_GET_METHOD( Real, Kmghatp );
  SIMPLE_SET_GET_METHOD( Real, Kkatp );
  SIMPLE_SET_GET_METHOD( Real, kmgatpa );
  SIMPLE_SET_GET_METHOD( Real, kmgatpd );

  virtual void initialize()
  {
    Process::initialize();

    S0 = getVariableReference( "S0" );
    S1 = getVariableReference( "S1" );
    P0 = getVariableReference( "P0" );
    E0 = getVariableReference( "E0" );
    E1 = getVariableReference( "E1" );
    E2 = getVariableReference( "E2" );

    theKmgatpa = kmgatpa * 
      ( ( Kmgatp + ( pow( 10, -1 * E0.getValue() ) * Khatp * Kmghatp ) ) /
	( 1 + ( pow( 10, -1 * E0.getValue() ) * Khatp ) +  E1.getMolarConc() * Kkatp ) );

  }  
  
  virtual void fire()
  {

    Real velocity = theKmgatpa * S0.getMolarConc() * S1.getMolarConc() -
      kmgatpd * P0.getMolarConc();

    velocity = velocity * getSuperSystem()->getSize() * N_A;

    velocity = velocity * E2.getValue() / 1000;

    setFlux( velocity );

  }

 protected:

  Real theKmgatpa;

  VariableReference S0;
  VariableReference S1;
  VariableReference P0;
  VariableReference E0;
  VariableReference E1;
  VariableReference E2;

  Real Kmgatp;
  Real Khatp;
  Real Kmghatp;
  Real Kkatp;
  Real kmgatpa;
  Real kmgatpd;

};

LIBECS_DM_INIT( BiUniMgATPFluxProcess, Process );
