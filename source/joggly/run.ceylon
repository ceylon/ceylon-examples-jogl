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
    value blue = [0.0, 0.0, 1.0];

    value tip = [0.0, 0.5, 0.0];
    value left = [-0.5, -0.5, 0.0];
    value right = [0.5, -0.5, 0.0];

    value triangle = [
        left -> red,
        right -> green,
        tip -> blue
    ];
    
    value glprofile = GLProfile.getDefault(null);
    value glcapabilities = GLCapabilities(glprofile);
    value glcanvas = GLCanvas(glcapabilities);
    glcanvas.setSize(400, 400);
    
    glcanvas.addGLEventListener(object satisfies GLEventListener {
        shared actual void display(GLAutoDrawable drawable) {
            value gl = drawable.gl.gl2;

            gl.glBegin(GL2.glTriangles);

            gl.glVertex3f(*tip);

            for (point -> color in triangle) {
                gl.glColor3f(*color);
                gl.glVertex3f(*point);
            }

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
