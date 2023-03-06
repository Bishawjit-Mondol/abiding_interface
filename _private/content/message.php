<?php $messages = getMessage(); ?>

<div class="about">
    <div class="wrap">
        <h1>MD's Message</h1>
        <?php while ($message = mysql_fetch_assoc($messages)) : ?>
            <div class="panels">
                <div class="panel-left">
                    <img src="images/db/<?= $message['img_id'] . $message['imgtype'] ?>" style="height:200px" alt="">
                </div>
                <div class="panel-right">
                    <h3><span><?= $message['caption'] ?></span><br /></h3>
                    <p>
                        <?= $message['description'] ?>
                    </p>
                </div>
                <div class="clear"> </div>
            </div>
        <?php endwhile; ?>
    </div>
</div>