<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Event */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="event-form">

    <?php $form = ActiveForm::begin(); ?>

         <?= $form->field($model, 'marketeer_id')->dropDownList(
    ArrayHelper::map(Marketeer::find()->all(),'id','full'),
    ['prompt'=>'Select Marketeer']


    )?>


    <?= $form->field($model, 'id')->textInput() ?>

    <?= $form->field($model, 'event_date_created')->textInput() ?>

    <?= $form->field($model, 'event_description')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'event_start_date')->textInput() ?>

    <?= $form->field($model, 'event_end_date')->textInput() ?>

    <?= $form->field($model, 'marketeer_id')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>