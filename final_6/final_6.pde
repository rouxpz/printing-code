import geomerative.*;
import org.apache.batik.svggen.font.table.*;
import org.apache.batik.svggen.font.*;
import java.util.List;
import net.jeremybrooks.knicker.AccountApi;
import net.jeremybrooks.knicker.WordApi;
import net.jeremybrooks.knicker.dto.Definition;
import net.jeremybrooks.knicker.dto.TokenStatus;
import processing.pdf.*;

String filename;

ArrayList<Word> heSaid = new ArrayList();
//ArrayList<Word> sheSaid = new ArrayList();
ArrayList<String> heSynonyms = new ArrayList();
//ArrayList<String> sheSynonyms = new ArrayList();

int totalWords = 0;

PImage neutral;
PImage sexy;

String[] he = { 
  "drunk", "pretty", "tryst", "beautiful", "asking", "shot", "drink", "spiked", "innocence", "sob", "wept", "intoxicate", "accuser", "credibility", "remember", "naked", "nude", "popular", 
   "cellphone", "alleged", "liaison", "sneak", "attractive", "myself", "girl", "flirt", "different", "version", "marijuana"
};
String[] no = { 
  "and", "a", "of", "has", "the"
};

void setup() {

  size(52, 73);

  beginRecord(PDF, "finaltest6.pdf");

  neutral = loadImage("neutral.jpg");
  sexy = loadImage("sexy.jpg");

  RG.init(this);
  RG.ignoreStyles(true);
  System.setProperty("WORDNIK_API_KEY", "9f049a0dbd5d1d146f10a0a1fa102917b85db795d50906b80");

  filename = "torrington.txt";

  background(255);
  smooth();

  //processWords(she);
  processWords(he);
  processFile(filename);
  fillImage();
  //println(totalWords);

  endRecord();
}


void processFile(String url) {

  String[] ta = loadStrings(url);
  for (int i = 3; i < ta.length; i++) {
    loadArticle(ta[i]);
    //println(ta[0]);
  }
}

void loadArticle(String input) {

  String[] words = input.split(" ");

  for (int i = 0; i < words.length; i++) {

    String w = words[i];
    w = w.toLowerCase();
    w = w.replaceAll("^\\p{Punct}+", " ");
    w = w.replaceAll("\\.", ""); //ditto all the way down
    w = w.replaceAll("\\,", "");
    w = w.replaceAll("\\--", "");
    w = w.replaceAll("\\-", "");
    w = w.replaceAll("\\:", "");
    w = w.replaceAll("\\;", "");
    w = w.replaceAll("\\!", "");
    w = w.replaceAll("\\?", "");
    w = w.replaceAll("\\\"", "");
    w = w.replaceAll("\\\n", "");

    totalWords++;

    for (int j = 0; j < heSynonyms.size(); j++) {
      if (w.indexOf(heSynonyms.get(j)) != -1) {
        //for (int m = 0; m < no.length; m++) {
          if (w.equals("and") || w.equals("a") || w.equals("said") || w.equals("has") || w.equals("of") || w.equals("at") || w.equals("had") || w.equals("was") || w.equals("because") || w.equals("can") || w.equals("an")) {
            //println(no[m]);
          } 
          else {
            Word word = new Word();
            word.value = w;
            word.id = i;
            heSaid.add(word);
            println(w);
          }
          //heCount++;
          //println(word.id + ": " + w);
        //}
      }
    }
  }
}

  void processWords(String[] dicts) {

    try {

      for (int k = 0; k < he.length; k++) {
        List<Related> def = WordApi.related(he[k]);
        //println("Found " + def.size() + " related words.");

        for (int i = 0; i < def.size(); i++) {

          String relType = def.get(i).getRelType();

          if (relType.indexOf("synonym") != -1) {
            List<String> syns = def.get(i).getWords();      
            for (int j = 0; j < syns.size(); j++) {

              String syn = syns.get(j);
              heSynonyms.add(syn);
              //println(syn);
            }
          } 

          else if (relType.indexOf("same-context") != -1) {
            List<String> context = def.get(i).getWords();
            for (int j = 0; j < context.size(); j++) {

              String sc = context.get(j);
              heSynonyms.add(sc);
            }
          }
        }
      }
    }

    catch (KnickerException e) {
      println("EAD");
    }

    for (int i = 0; i < he.length; i++) {
      heSynonyms.add(he[i]);
    }


    //println(heSynonyms.size());
    //println(sheSynonyms.size());
  }

  void fillImage() {

    neutral.loadPixels();
    sexy.loadPixels();

    //int a = round(map(heSaid.size(), 0, 500, 0, 255)); 
    int a = 255;
    //int loc;

    for (int y = 0; y < height-5; y++) {
      for (int x = 0; x < width; x ++) {

        int realX = x/2;
        int realY = y/2;

        int loc = x+(y*width);
        int distilledloc = realX + realY*26;
        //println(loc);


        noStroke();

        //fill of the initial pixel
        color nc = neutral.get(x, y);
        fill(nc);
        rect (x, y, 1, 1);

        //fill of the pixel below
        nc = neutral.get(x, y+1);
        fill(nc);
        rect (x, y+1, 1, 1);

        //fill of the pixel to the right
        nc = neutral.get(x+1, y);
        fill(nc);
        rect (x+1, y, 1, 1);

        //fill of the kitty corner pixel
        nc = neutral.get(x+1, y+1);
        fill(nc);
        rect (x+1, y+1, 1, 1);

        for (Word w:heSaid) {
          if (distilledloc ==  w.id) {

            //fill of the initial pixel
            color sc = sexy.get(x, y);
            color newSC = color(sc, a);
            fill(newSC);
            rect (x, y, 1, 1);


            //fill of the pixel below
            sc = sexy.get(x, y+1);
            newSC = color(sc, a);
            fill(newSC);
            rect (x, y+1, 1, 1);

            //fill of the pixel to the right
            sc = sexy.get(x+1, y);
            fill(sc);
            rect (x+1, y, 1, 1);

            //fill of the kitty corner pixel
            sc = sexy.get(x+1, y+1);
            fill(sc);
            rect (x+1, y+1, 1, 1);
          }
        }
      }
    }
    
    fill(255);
    rect(0, height-5, width, 5);
  }


  void keyPressed() {
  }

