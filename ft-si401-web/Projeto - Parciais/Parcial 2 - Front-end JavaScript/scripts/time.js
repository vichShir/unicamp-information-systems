/**
 * Gerenciadores dos tempos (Stopwatch e Timer):
 */

"use strict";

/**
 * Classe responsável por controlar os detalhes do cronômetro:
 * - Interface com start, stop, reset do stopwatch e tempo final
 * - Loop que controla o incremento dos tempos
 * - Exibir o resultado no Front End
 * */
class StopWatch
{
  static #stopwatchHTML; // Elemento html
  static #cron; // Objeto setInterval

  static #hour = 0; // Horas
  static #minute = 0; // Minutos
  static #second = 0; // Segundos
  static #delay = 1000; // Delay em millisegundos
  static set Delay(delay) { this.#delay = delay; }
  
  // Iniciar stopwatch
  static start(stopwatchTag)
  {
    // Configurar variáveis
    this.#stopwatchHTML = document.getElementById(stopwatchTag);

    // Configurar ambiente
    this.reset();
    this.#printHTML();

    // Executar temporizador
    this.#cron = setInterval(() => { this.#timeCycle(); }, this.#delay);
  }

  // Parar stopwatch de contabilizar
  static stop()
  {
    clearTimeout(this.#cron);
  }

  // Zerar stopwatch
  static reset()
  {
    this.#hour = 0;
    this.#minute = 0;
    this.#second = 0;
    this.stop();
  }

  // Interfaces para pegar os tempos finais
  static get finalHour() { return this.#hour; }
  static get finalMinute() { return this.#minute; }
  static get finalSecond() { return this.#second; }

  // Controle do stopwatch
  static #timeCycle()
  {
    if ((this.#second += 1) === 60) 
    {
      this.#second = 0;
      this.#minute += 1;
    }

    if (this.#minute === 60) 
    {
      this.#minute = 0;
      this.#hour += 1;
    }

    this.#printHTML();
  }

  // Exibir no html
  static #printHTML()
  {
    var second_text = this.#second.toLocaleString('en-US', {
      minimumIntegerDigits: 2,
      useGrouping: false
    })
    var minute_text = this.#minute.toLocaleString('en-US', {
      minimumIntegerDigits: 2,
      useGrouping: false
    })
    var hour_text = this.#hour.toLocaleString('en-US', {
      minimumIntegerDigits: 2,
      useGrouping: false
    })

    this.#stopwatchHTML.innerHTML = hour_text + ":" + minute_text + ":" + second_text;
  }
}

/**
 * Classe responsável por controlar os detalhes do temporizador:
 * - Interface com executar função quando timer acabar
 * - Interface com start, stop e reset do timer
 * - Converter segundos em horas, minutos e segundos
 * - Loop que controla o decremento dos tempos
 * - Exibir o resultado no Front End
 * */
class Timer
{
  static #timerHTML; // Elemento html
  static #timer; // Objeto setInterval

  static #totalSeconds; // Tempo inicial do temporizador
  static #hour = 0; // Horas
  static #minute = 0; // Minutos
  static #second = 0; // Segundos
  static #delay = 1000; // Delay em millisegundos
  static set Delay(delay) { this.#delay = delay; }

  // Função da instancia a ser executada quando o timer acabar
  // A instancia deve implementar a função callback()
  static #callbackInstance;

  // Executar função quando o timer zerar
  static execOnFinish(instance)
  {
    this.#callbackInstance = instance;
  }

  // Iniciar timer
  static start(timerTag, totalSeconds)
  {
    // Configurar variáveis
    this.#timerHTML = document.getElementById(timerTag);
    this.#totalSeconds = totalSeconds;

    // Configurar ambiente
    this.reset();
    this.#convertSecondsToMyTime();
    this.#printHTML();

    // Executar temporizador
    this.#timer = setInterval(() => { this.#timeCycle(); }, this.#delay);
  }

  // Parar timer de contabilizar
  static stop()
  {
    clearTimeout(this.#timer);
  }

  // Zerar timer
  static reset()
  {
    this.#minute = 0;
    this.#second = 0;
    this.#hour = 0;
    this.stop();
  }

  // Converter segundos em horas, minutos e segundos
  static #convertSecondsToMyTime()
  {
    this.#hour = Math.floor(this.#totalSeconds / 3600);
    this.#totalSeconds %= 3600;
    this.#minute = Math.floor(this.#totalSeconds / 60);
    this.#second = this.#totalSeconds % 60;
  }

  // Controle do timer
  static #timeCycle()
  {
    if(this.#second > 0)
    {
      this.#second -= 1;
    }
    else
    {
      if(this.#minute > 0)
      {
        this.#second = 59;
        this.#minute -= 1;
      }
      else
      {
        if(this.#hour > 0)
        {
          this.#second = 59;
          this.#minute = 59;
          this.#hour -= 1;
        }
        else
        {
          this.stop();
          this.#callbackInstance.callback();
        }
      }
    }

    this.#printHTML();
  }

  // Exibir no html
  static #printHTML()
  {
    var second_text = this.#second.toLocaleString('en-US', {
      minimumIntegerDigits: 2,
      useGrouping: false
    })
    var minute_text = this.#minute.toLocaleString('en-US', {
      minimumIntegerDigits: 2,
      useGrouping: false
    })
    var hour_text = this.#hour.toLocaleString('en-US', {
      minimumIntegerDigits: 2,
      useGrouping: false
    })

    this.#timerHTML.innerHTML = hour_text + ":" + minute_text + ":" + second_text;
  }
}