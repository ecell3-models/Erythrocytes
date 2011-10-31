#include "libecs.hpp"
#include "Util.hpp"
#include "PropertyInterface.hpp"

#include "System.hpp"

#include "ContinuousProcess.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( BiUniMgFru16P2FluxProcess, ContinuousProcess )
{

 public:

  LIBECS_DM_OBJECT( BiUniMgFru16P2FluxProcess, Process )
    {
      INHERIT_PROPERTIES( Process );

      PROPERTYSLOT_SET_GET( Real, Kmgfru16p2 );
      PROPERTYSLOT_SET_GET( Real, Khf );
      PROPERTYSLOT_SET_GET( Real, Kmghf );
      PROPERTYSLOT_SET_GET( Real, Kh2f );
      PROPERTYSLOT_SET_GET( Real, Kkf );
      PROPERTYSLOT_SET_GET( Real, Kkhf );
      PROPERTYSLOT_SET_GET( Real, kmgf16p2a );
      PROPERTYSLOT_SET_GET( Real, kmgf16p2d );

    }

  SIMPLE_SET_GET_METHOD( Real, Kmgfru16p2 );
  SIMPLE_SET_GET_METHOD( Real, Khf );
  SIMPLE_SET_GET_METHOD( Real, Kmghf );
  SIMPLE_SET_GET_METHOD( Real, Kh2f );
  SIMPLE_SET_GET_METHOD( Real, Kkf );
  SIMPLE_SET_GET_METHOD( Real, Kkhf );
  SIMPLE_SET_GET_METHOD( Real, kmgf16p2a );
  SIMPLE_SET_GET_METHOD( Real, kmgf16p2d );

  virtual void initialize()
  {
    Process::initialize();

    S0 = getVariableReference( "S0" );
    S1 = getVariableReference( "S1" );
    P0 = getVariableReference( "P0" );
    E0 = getVariableReference( "E0" );
    E1 = getVariableReference( "E1" );

    Real mgfphf = 8.3 * 0.001 * 
      ( Kmgfru16p2 + pow( 10, -1 * E0.getValue() ) * Khf * Kmghf ) /
      ( 1 + ( pow( 10, -1 * E0.getValue() ) * Khf ) + 
	( pow( 10, -2 * E0.getValue() ) * Khf * Kh2f ) +
	( E1.getMolarConc() * Kkf ) +
	( E1.getMolarConc() * pow( 10, -1 * E0.getValue() ) * Khf * Kkhf ) );
    
    theKmgf16p2a = kmgf16p2a * mgfphf;
  }  
  
  virtual void fire()
  {
    Real velocity = theKmgf16p2a * S0.getMolarConc() * S1.getMolarConc() -
      kmgf16p2d * P0.getMolarConc();

    velocity = velocity * getSuperSystem()->getSize() * N_A;

    setFlux( velocity );

  }

 protected:

  Real theKmgf16p2a;

  VariableReference S0;
  VariableReference S1;
  VariableReference P0;
  VariableReference E0;
  VariableReference E1;

  Real Kmgfru16p2;
  Real Khf;
  Real Kmghf;
  Real Kh2f;
  Real Kkf;
  Real Kkhf;
  Real kmgf16p2a;
  Real kmgf16p2d;

};

LIBECS_DM_INIT( BiUniMgFru16P2FluxProcess, Process );
