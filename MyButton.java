package labb4;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class MyButton extends JButton implements ActionListener {

    private int state;
    private final Color[] colArray = new Color[2];
    private final String[] textArray = new String[2];

    public MyButton(Color col1, Color col2, String text1, String text2) {
        state = 0;
        colArray[0] = col1;
        colArray[1] = col2;
        textArray[0] = text1;
        textArray[1] = text2;
        setOpaque(true);
        setBackground(colArray[state]);
        setText(textArray[state]);
    }

    public MyButton() {
        this(Color.GREEN, Color.RED, "Start", "Stopp");
    }

    public void toggleState() {
        state = (state + 1) % 2;
        setBackground(colArray[state]);
        setText(textArray[state]);
    }

    public boolean getState() {
        return state != 0;
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        toggleState();
    }

}
