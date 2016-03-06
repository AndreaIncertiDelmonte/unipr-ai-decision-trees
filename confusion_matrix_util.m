#
# Computes sensitivity and specificity on confusion matrix
#
# @Author Andrea Incerti Delmonte - andrea.incertidelmonte@gmail.com
#
# Matrix are obtained with Weka 3.6.13
# Training set glass.arff
# Classifier j48
# Random split 66%
# n = random number seed param
# m = minNumObj param -  the minimum number of instances per leaf.

n1m1 = [12,6,1,0,0,0,1;6,16,2,0,2,3,3;0,1,2,0,0,0,1;0,0,0,0,0,0,0;0,0,0,0,3,0,1;1,0,0,0,0,1,0;1,0,0,0,0,0,10];
n1m2 = [12,6,1,0,0,0,1;7,16,1,0,2,3,3;2,0,1,0,0,0,1;0,0,0,0,0,0,0;0,0,0,0,2,0,2;1,0,0,0,0,1,0;1,0,0,0,0,0,10];
n1m4 = [14,4,1,0,0,0,1;6,18,0,0,2,3,3;1,1,1,0,0,0,1;0,0,0,0,0,0,0;0,0,0,0,3,0,1;1,0,0,0,0,1,0;1,0,0,0,0,0,10];

n2m1 = [21,3,0,0,0,1,4;7,14,1,0,0,1,2;4,1,0,0,0,1,0;0,0,0,0,0,0,0;0,1,0,0,3,0,1;0,0,0,0,0,2,0;0,1,0,0,0,0,5];
n2m2 = [21,6,0,0,0,1,1;7,14,1,0,0,2,1;4,1,0,0,0,1,0;0,0,0,0,0,0,0;0,1,0,0,3,0,1;0,0,0,0,0,2,0;0,1,0,0,0,0,5];
n2m4 = [24,3,0,0,0,1,1;5,16,1,0,0,2,1;4,1,0,0,0,1,0;0,0,0,0,0,0,0;0,1,0,0,3,0,1;0,0,0,0,0,2,0;0,1,0,0,0,0,5];

n3m1 = [15,6,2,0,0,0,1;1,21,0,0,0,1,1;2,3,1,0,0,0,0;0,0,0,0,0,0,0;0,2,0,0,2,0,0;0,0,0,0,0,4,0;0,0,0,0,0,0,11];
n3m2 = [15,6,2,0,0,0,1;2,19,0,0,1,1,1;2,3,1,0,0,0,0;0,0,0,0,0,0,0;0,1,0,0,2,0,1;0,0,0,0,0,4,0;0,0,0,0,0,0,11];
n3m4 = [15,7,1,0,0,0,1;1,20,0,0,1,1,1;1,3,2,0,0,0,0;0,0,0,0,0,0,0;0,1,0,0,2,0,1;0,0,0,0,0,4,0;0,0,0,0,0,0,11];

n4m1 = [18,6,0,0,0,0,0;1,12,6,0,0,1,1;2,2,3,0,0,0,0;0,0,0,0,0,0,0;0,4,0,0,3,0,1;0,0,0,0,0,1,0;0,1,0,0,0,0,11];
n4m2 = [18,6,0,0,0,0,0;1,15,3,0,0,1,1;3,2,2,0,0,0,0;0,0,0,0,0,0,0;0,4,0,0,3,0,1;0,0,0,0,0,1,0;0,1,0,0,0,0,11];
n4m4 = [20,4,0,0,0,0,0;4,13,2,0,0,1,1;3,2,2,0,0,0,0;0,0,0,0,0,0,0;0,4,0,0,3,0,1;0,0,0,0,0,1,0;0,1,0,0,0,0,11];

n5m1 = [21,3,3,0,0,0,0;2,12,6,0,1,1,0;3,1,2,0,0,0,0;0,0,0,0,0,0,0;0,2,0,0,1,0,0;0,0,0,0,0,4,0;0,2,0,0,0,0,9];
n5m2 = [24,2,1,0,0,0,0;2,12,6,0,1,1,0;3,0,3,0,0,0,0;0,0,0,0,0,0,0;0,2,0,0,1,0,0;0,0,0,0,0,4,0;0,2,1,0,0,0,8];
n5m4 = [19,6,2,0,0,0,0;0,18,3,0,0,1,0;3,1,2,0,0,0,0;0,0,0,0,0,0,0;0,2,0,0,1,0,0;0,0,0,0,0,4,0;0,1,0,0,2,0,8];

matrixes = {n1m1, n1m2, n1m4, n2m1, n2m2, n2m4, n3m1, n3m2, n3m4, n4m1, n4m2, n4m4, n5m1, n5m2, n5m4,};
size(matrixes)(2)
for m = 1:size(matrixes)(2)

  matrix = matrixes{m};

  matrix
  
  avg_sensitivity = 0;
  avg_specificity = 0;

  fprintf ("\nT+ F- F+ T- sensitivity specificity");
  
  for i = 1:rows(matrix)

    true_positive = matrix(i,i);
    
    false_negative = sum(matrix(i,:)) - true_positive; %row
    
    false_positive = sum(matrix(:,i)) - true_positive; % col
    
    true_negative = trace(matrix) - true_positive;
    
    sensitivity = 0;
    if (true_positive + false_negative) > 0
      sensitivity = true_positive / (true_positive + false_negative);
    end
    
    specificity = 0;
    if (true_negative + false_positive) > 0
      specificity = true_negative / (true_negative + false_positive);
    end
    
    avg_sensitivity = avg_sensitivity + sensitivity;
    avg_specificity = avg_specificity + specificity;
    
    
    fprintf ("\n%d %d %d %d %d %d %d", true_positive, false_negative,false_positive,true_negative,sensitivity,specificity);
  end

  fprintf ("\n");
  avg_sensitivity = avg_sensitivity / rows(matrix)
  avg_specificity = avg_specificity / rows(matrix)
  
  
  fprintf ("\n\n");
end














