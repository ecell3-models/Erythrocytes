#include "libecs.hpp"
#include "Util.hpp"
#include "PropertyInterface.hpp"

#include "System.hpp"

#include "ContinuousProcess.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( BiUniMgPhosFluxProcess, ContinuousProcess )
{

 public:

  LIBECS_DM_OBJECT( BiUniMgPhosFluxProcess, Process )
    {
      INHERIT_PROPERTIES( Process );

      PROPERTYSLOT_SET_GET( Real, Khphos );
      PROPERTYSLOT_SET_GET( Real, Kkphos );
      PROPERTYSLOT_SET_GET( Real, kmgphosa );
      PROPERTYSLOT_SET_GET( Real, kmgphosd ); 
    }

  SIMPLE_SET_GET_METHOD( Real, Khphos );
  SIMPLE_SET_GET_METHOD( Real, Kkphos );
  SIMPLE_SET_GET_METHOD( Real, kmgphosa );
  SIMPLE_SET_GET_METHOD( Real, kmgphosd );

  virtual void initialize()
  {
    Process::initialize();

    S0 = getVariableReference( "S0" );
    S1 = getVariableReference( "S1" );
    P0 = getVariableReference( "P0" );
    E0 = getVariableReference( "E0" );
    E1 = getVariableReference( "E1" );

    theKmgphosa = kmgphosa * ( ( 1 + pow( 10, -7.2 ) * Khphos + 0.15 * Kkphos ) /
				( 1 + pow( 10, -1 * E0.getValue() ) * Khphos +
				  E1.getMolarConc() * Kkphos ) );
  }  
  
  virtual void fire()
  {

    Real velocity = theKmgphosa * S0.getMolarConc() * S1.getMolarConc() -
      kmgphosd * P0.getMolarConc();

    velocity = velocity * getSuperSystem()->getSize() * N_A;

    setFlux( velocity );

  }

 protected:

  Real theKmgphosa;

  VariableReference S0;
  VariableReference S1;
  VariableReference P0;
  VariableReference E0;
  VariableReference E1;

  Real Khphos;
  Real Kkphos;
  Real kmgphosa;
  Real kmgphosd;

};

LIBECS_DM_INIT( BiUniMgPhosFluxProcess, Process );
