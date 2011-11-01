#include "libecs.hpp"
#include "Util.hpp"
#include "PropertyInterface.hpp"

#include "System.hpp"

#include "ContinuousProcess.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( MassActionFluxAConProcess, ContinuousProcess )
{

 public:

  LIBECS_DM_OBJECT( MassActionFluxAConProcess, Process )
    {
      INHERIT_PROPERTIES( Process );

      PROPERTYSLOT_SET_GET( Real, k );
    }

  MassActionFluxAConProcess()
    :
    k( 0.0 )
    {
      ; // do nothing
    }
  
  SIMPLE_SET_GET_METHOD( Real, k );
  
  virtual void initialize()
  {
    Process::initialize();
    E0 = getVariableReference( "E0" );
  }  

  virtual void fire()
  {
    
    Real velocity( k * N_A * E0.getValue()/1000.0 ); //ducky 090716
    velocity *= getSuperSystem()->getSize();

    for( VariableReferenceVector::const_iterator 
	   s( theVariableReferenceVector.begin() );
	 s != theZeroVariableReferenceIterator; ++s )
      {
	VariableReference aVariableReference( *s );
	Integer aCoefficient( aVariableReference.getCoefficient() );
	do {
	  ++aCoefficient;
	  velocity *= aVariableReference.getMolarConc();
	} while( aCoefficient != 0 );
	
      }
    
    setFlux(velocity);
    
  }
  
  /*  virtual void initialize()
  {
    Process::initialize();
    declareUnidirectional();
  } 
  */ 

 protected:
  
  Real k;
  VariableReference E0;    

};

LIBECS_DM_INIT( MassActionFluxAConProcess, Process );
