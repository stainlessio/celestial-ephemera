#include "cinder/app/App.h"
#include "cinder/app/RendererGl.h"
#include "cinder/gl/gl.h"
#include "cinder/gl/Texture.h"

#include <memory>

using namespace ci;
using namespace ci::app;
using namespace std;

// We'll create a new Cinder Application by deriving from the App class
class BasicApp : public App
{
public:
    void setup() override;
    void draw() override;
};

void BasicApp::setup()
{
}

void BasicApp::draw()
{
    
}

// This line tells Cinder to actually create the application
CINDER_APP( BasicApp, RendererGl )
