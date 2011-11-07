#include "libecs.hpp"
#include "Util.hpp"
#include "PropertyInterface.hpp"

#include "System.hpp"

#include "ContinuousProcess.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( UniUniRU5PFluxProcess, ContinuousProcess )
{

 public:

  LIBECS_DM_OBJECT( UniUniRU5PFluxProcess, Process )
    {
      INHERIT_PROPERTIES( Process );

      PROPERTYSLOT_SET_GET( Real, k1 );
      PROPERTYSLOT_SET_GET( Real, k2 );
      PROPERTYSLOT_SET_GET( Real, k3 );
      PROPERTYSLOT_SET_GET( Real, k4 );
      PROPERTYSLOT_SET_GET( Real, Ru5P );
    }

  SIMPLE_SET_GET_METHOD( Real, k1 );
  SIMPLE_SET_GET_METHOD( Real, k2 );
  SIMPLE_SET_GET_METHOD( Real, k3 );
  SIMPLE_SET_GET_METHOD( Real, k4 );
  SIMPLE_SET_GET_METHOD( Real, Ru5P );

  virtual void initialize()
  {
    Process::initialize();

    S0 = getVariableReference( "S0" );
    P0 = getVariableReference( "P0" );
    E0 = getVariableReference( "E0" );
    
    Kmru5pe = ( k2 + k3 ) / k1;
    Kmxu5pe = ( k2 + k3 ) / k4;

  }  
  
  virtual void fire()
  {
    Real r5pird = 1 + ( S0.getMolarConc() / Kmru5pe ) + ( P0.getMolarConc() / Kmxu5pe );

    Real velocity = ( Ru5P / r5pird ) * 
      ( ( k3 * S0.getMolarConc() ) / ( Kmru5pe ) -
	( k2 * P0.getMolarConc() ) / ( Kmxu5pe ) );

    velocity = velocity * getSuperSystem()->getSize() * N_A;

    velocity = velocity * E0.getValue() / 1000;

    setFlux( velocity );

  }

 protected:

  Real Kmru5pe;
  Real Kmxu5pe;

  VariableReference S0;
  VariableReference P0;
  VariableReference E0;

  Real k1;
  Real k2;
  Real k3;
  Real k4;

  Real Ru5P;

};

LIBECS_DM_INIT( UniUniRU5PFluxProcess, Process );
