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

    void drawTriangle(GLAutoDrawable drawable) {
        value gl = drawable.gl.gl2;

        gl.glBegin(GL2.glTriangles);

        gl.glVertex3f(*tip);

        for (point -> color in triangle) {
            gl.glColor3f(*color);
            gl.glVertex3f(*point);
        }

        gl.glEnd();
    }

    value glprofile = GLProfile.getDefault(null);
    value glcapabilities = GLCapabilities(glprofile);
    value glcanvas = GLCanvas(glcapabilities);
    glcanvas.setSize(400, 400);
    glcanvas.addGLEventListener(object satisfies GLEventListener {
        display(GLAutoDrawable drawable) => drawTriangle(drawable);
        reshape = noop;
        init = noop;
        dispose = noop;
    });
    
    value jframe = JFrame("Hello JOGL");
    jframe.addWindowListener(object extends WindowAdapter() {
        windowClosing(WindowEvent e) => jframe.dispose();
    });
    jframe.contentPane.add(glcanvas);
    jframe.setSize(600, 400);
    jframe.setVisible(true);
    
}
