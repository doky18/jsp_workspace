package mvc.gui;

import java.awt.FlowLayout;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

import mvc.model.blood.BloodAdvisor;

public class BloodMain extends JFrame{
	JComboBox <String> box;
	JButton bt;
	BloodAdvisor advisor;
	
	public BloodMain() {
		box = new JComboBox<String>();
		bt = new JButton("분석요청");
		advisor = new BloodAdvisor();
		//혈액형 초기화
		box.addItem("A");
		box.addItem("B");
		box.addItem("O");
		box.addItem("AB");
		
		setLayout(new FlowLayout());
		add(box);
		add(bt);
		
		setVisible(true);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		setSize(300, 400);
		
		bt.addActionListener((e)->{
			//람다 왜 써? 짧게 가려고. but 성능과는 관계 없음. 오히려 재사용성이 없다는 것을 참고!
			getAdvice();
		});
	}

	public void getAdvice() {
		String result = advisor.getAdvice((String)box.getSelectedItem());
		JOptionPane.showMessageDialog(this, result);
	}
	
	public static void main(String[] args) {
		new BloodMain();
	}
}
