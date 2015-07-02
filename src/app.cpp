#include "cinder/app/AppBasic.h"

#include <memory>

using namespace ci;
using namespace ci::app;
using namespace std;

// We'll create a new Cinder Application by deriving from the App class
class BasicApp : public AppBasic
{
public:
    void draw() override;
};

void BasicApp::draw()
{
    
}

// This line tells Cinder to actually create the application
CINDER_APP_BASIC( BasicApp, RendererGl )
