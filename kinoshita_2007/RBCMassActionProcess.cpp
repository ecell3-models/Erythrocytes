#include "libecs.hpp"
#include "Util.hpp"
#include "PropertyInterface.hpp"

#include "System.hpp"
#include "ContinuousProcess.hpp"

#include "Stepper.hpp"

USE_LIBECS;
 
LIBECS_DM_CLASS( RBCMassActionProcess, ContinuousProcess )
{
  
 public:
  
  LIBECS_DM_OBJECT( RBCMassActionProcess, Process ){
    
    INHERIT_PROPERTIES( Process );
    
    PROPERTYSLOT_SET_GET( Real, k );
    
  }
  
  RBCMassActionProcess()
    :
    k( 0.0 )
    {
      ; // do nothing
    }
  
  SIMPLE_SET_GET_METHOD( Real, k );
  
  virtual void initialize(){
    
    Process::initialize();
    
    S0 = getVariableReference( "S0" );
    C0 = getVariableReference( "C0" );
    E0 = getVariableReference( "E0" );

    ConstAct = E0.getCoefficient();
    
  }
  
  virtual void fire(){
  
    Real velocity = 1;
  
    Real ActCo = E0.getVariable()->getValue();

    if( ActCo == 0 ){
      
      velocity = ConstAct;

    }
    
    else{

      velocity = k * N_A;

      velocity *= S0.getVariable()->getSuperSystem()->getSize();

      for( VariableReferenceVector::const_iterator
	     i( theVariableReferenceVector.begin() );
	   i != theZeroVariableReferenceIterator; ++i ){
	
        VariableReference aVariableReference( *i );

	Integer aCoefficient( aVariableReference.getCoefficient() );
        do {
          ++aCoefficient;

          velocity *= 1000 * aVariableReference.getMolarConc();

        } while( aCoefficient != 0 );
	
      }
      
      velocity *= ActCo / 1000 / 1000 / 3600;
    }

    //    Real aStepInterval( getStepper()->getStepInterval() );
    //    velocity *= aStepInterval;

    if( velocity > 0 ){

      for( VariableReferenceVector::const_iterator
	     i( theVariableReferenceVector.begin() );
	   i != theZeroVariableReferenceIterator; ++i ){

        VariableReference aVariableReference( *i );

	Real num( aVariableReference.getValue() );
	Real Rv( velocity * -aVariableReference.getCoefficient() );

	if( Rv > num ){

	  velocity = num;

	}
	if( num <= 0 ){
	  
	  velocity = 0;

	}
      }
      
    }
    else{
      
      velocity = 0;
    }

    //    velocity /= aStepInterval;

    setFlux( velocity );

  }
  
 protected:
  
  VariableReference S0;
  VariableReference C0;
  VariableReference E0;
  
  Real ConstAct;
  
  Real k;

};

LIBECS_DM_INIT( RBCMassActionProcess, Process );
