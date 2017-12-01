#!/usr/bin/env python
# -*- coding: utf-8 -*-

import pygtk
pygtk.require('2.0')
import gtk
import fileinput
import glob

Form = gtk.Window(gtk.WINDOW_TOPLEVEL)
Form.set_title("Gerador eventMacros.txt")
Form.set_size_request(400, 100)
Form.connect("delete_event", lambda w,e: gtk.main_quit())

hbox = gtk.HBox(False, 0)

cbxJobs = gtk.combo_box_new_text()
cbxJobs.append_text("Arcano")
cbxJobs.append_text("Arcebispo")
cbxJobs.append_text("Bioquímico")
cbxJobs.append_text("Cavaleiro Rúnico")
cbxJobs.append_text("Feiticeiro")
cbxJobs.append_text("Guardião Real")
cbxJobs.append_text("Mecânico")
cbxJobs.append_text("Musa")
cbxJobs.append_text("Renegado")
cbxJobs.append_text("Sentinela")
cbxJobs.append_text("Sicário")
cbxJobs.append_text("Shura")
cbxJobs.append_text("Trovador")

botao = gtk.Button("Gerar")
def gerar(widget):
    job = cbxJobs.get_active_text()
    if(job):
        jobSimples = job.lower().replace(" ","-").replace("í","i").replace("ú","u").replace("â","a").replace("ã","a").replace("á","a")
        outfile = open("eventMacros.txt", 'w')
        for line in fileinput.input(glob.glob("comum/*.pm")):
            outfile.write(line)
        for line in fileinput.input(glob.glob("classes/"+jobSimples+"/*.pm")):
            outfile.write(line)
        outfile.close()
        md = gtk.MessageDialog(Form, 
        gtk.DIALOG_MODAL, gtk.MESSAGE_INFO, 
        gtk.BUTTONS_OK, "eventMacros.txt para "+job+" gerado com sucesso!")
        md.run()
        gtk.main_quit()
    else:
        md = gtk.MessageDialog(Form, 
        gtk.DIALOG_MODAL, gtk.MESSAGE_ERROR, 
        gtk.BUTTONS_OK, "Selecione uma classe")
        md.run()

botao.connect('clicked', gerar)

hbox.add(cbxJobs)
hbox.add(botao)
Form.add(hbox)
Form.show_all()
gtk.main()





#$btn.Add_click({
#    $job = $cbxJobs.SelectedItem
#    if($job){
#        del eventMacros.txt
#        $jobSimples = $job.ToString().ToLower().Replace(" ","-").Replace("í","i").Replace("ú","u").Replace("â","a").Replace("ã","a").Replace("á","a")
#        Get-Content -Encoding UTF8 classes\$jobSimples\*.pm | Out-File eventMacros.txt -Encoding UTF8 -append
#        Get-Content -Encoding UTF8 comum\*.pm | Out-File eventMacros.txt -Encoding UTF8 -append
#        [System.Windows.Forms.MessageBox]::Show("eventMacros.txt para "+$job+" gerado com sucesso!" , "Ok")
#        $Form.Dispose()
#    } else{
#        [System.Windows.Forms.MessageBox]::Show("Erro, nenhum item selecionado", "Selecione uma classe")
#    }