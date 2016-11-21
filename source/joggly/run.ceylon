import com.jogamp.opengl {
    GLProfile,
    GLCapabilities,
    GLEventListener,
    GLAutoDrawable,
    GL2
}
import com.jogamp.opengl.awt {
    GLCanvas
}

import java.awt.event {
    WindowAdapter,
    WindowEvent
}

import javax.swing {
    JFrame
}

shared void run() {
    
    value red = [1.0, 0.0, 0.0];
    value green = [0.0, 1.0, 0.0];
    value blue = [0.0, 0.5, 1.0];
    
    value glprofile = GLProfile.getDefault(null);
    value glcapabilities = GLCapabilities(glprofile);
    value glcanvas = GLCanvas(glcapabilities);
    glcanvas.setSize(400, 400);
    
    glcanvas.addGLEventListener(object satisfies GLEventListener {
        shared actual void display(GLAutoDrawable drawable) {
            value gl = drawable.gl.gl2;
            
            gl.glBegin(GL2.glTriangles);
            
            gl.glVertex3f(0.0, 0.5, 0.0); //tip
            
            gl.glColor3f(*red); 
            gl.glVertex3f(-0.5, -0.5, 0.0); //left edge 
            
            gl.glColor3f(*green); 
            gl.glVertex3f(0.5, -0.5, 0.0); //base 
            
            gl.glColor3f(*blue); 
            gl.glVertex3f(0.0, 0.0, 0.0); //right edge 
            
            gl.glEnd();         
            
        }
        shared actual void reshape(GLAutoDrawable drawable, 
            Integer x, Integer y, 
            Integer width, Integer height) {}
        shared actual void init(GLAutoDrawable drawable) {}
        shared actual void dispose(GLAutoDrawable drawable) {}
    });
    
    value jframe = JFrame("Hello JOGL");
    
    jframe.addWindowListener(object extends WindowAdapter() {
        windowClosing(WindowEvent e) => jframe.dispose();
    });
    
    jframe.contentPane.add(glcanvas);
    jframe.setSize(600, 400);
    jframe.setVisible(true);
    
}
